import puppeteer, { Browser, HTTPRequest, Page } from 'puppeteer';
import { ServiceConfig, WaitStrategy } from './config.js';

export interface RenderResult {
  html: string;
  status: number;
  headers: Record<string, string>;
}

export class Renderer {
  private browserPromise: Promise<Browser> | null = null;

  constructor(private readonly config: ServiceConfig) {}

  private async getBrowser(): Promise<Browser> {
    if (!this.browserPromise) {
      console.log('🚀 Launching browser...');
      this.browserPromise = puppeteer.launch({
        args: [
          '--no-sandbox',
          '--disable-setuid-sandbox',
          '--disable-dev-shm-usage',
          '--disable-gpu',
          '--no-zygote',
          '--single-process'
        ],
        headless: true,
        executablePath: process.env.PUPPETEER_EXECUTABLE_PATH
      }).then(browser => {
        console.log('✅ Browser launched successfully');
        return browser;
      }).catch(error => {
        console.error('❌ Failed to launch browser:', error);
        throw error;
      });
    }
    return this.browserPromise;
  }

  async render(fullUrl: string): Promise<RenderResult> {
    console.log(`🎬 Starting render for: ${fullUrl}`);
    const browser = await this.getBrowser();
    const page = await browser.newPage();
    
    try {
      console.log('📄 Setting up page...');
      await page.setUserAgent(this.config.userAgent);
      await page.setRequestInterception(true);

      // Add detailed request logging
      page.on('request', (req: HTTPRequest) => {
        const resourceType = req.resourceType();
        if (resourceType === 'image' || resourceType === 'media' || resourceType === 'font') {
          console.log(`🚫 Blocked ${resourceType}: ${req.url()}`);
          req.abort();
          return;
        }
        console.log(`✅ Allowing ${resourceType}: ${req.url()}`);
        req.continue();
      });

      // Add response logging
      page.on('response', (response) => {
        console.log(`📡 Response ${response.status()}: ${response.url()}`);
      });

      // Add console logging from the page
      page.on('console', (msg) => {
        console.log(`🖥️  Browser console: ${msg.type()}: ${msg.text()}`);
      });

      // Add page error logging
      page.on('pageerror', (error) => {
        console.error(`❌ Page error: ${error.message}`);
      });

      console.log('🌐 Navigating to page...');
      const response = await page.goto(fullUrl, {
        waitUntil: ['domcontentloaded', 'networkidle0'],
        timeout: this.config.maxRenderTimeMs
      });

      if (!response) {
        throw new Error('No response received');
      }

      console.log(`📊 Initial response status: ${response.status()}`);

      // Wait for content with detailed logging
      console.log('⏳ Applying wait strategy...');
      await this.applyWaitStrategy(page, this.config.waitStrategy);

      // Additional wait for dynamic content
      console.log('🕒 Waiting for dynamic content...');
      await new Promise(resolve => setTimeout(resolve, 3000));

      // Check what content we have before getting HTML
      const contentInfo = await page.evaluate(() => {
        const bodyText = document.body.innerText || '';
        const bodyHTML = document.body.innerHTML || '';
        
        return {
          title: document.title,
          bodyTextLength: bodyText.length,
          bodyHTMLength: bodyHTML.length,
          hasMain: !!document.querySelector('main'),
          hasRoot: !!document.querySelector('#root'),
          hasApp: !!document.querySelector('#app'),
          allElements: document.querySelectorAll('*').length,
          visibleText: bodyText.substring(0, 200) + '...'
        };
      });

      console.log('📋 Content analysis:', JSON.stringify(contentInfo, null, 2));

      // Take a screenshot for debugging (optional)
      // await page.screenshot({ path: '/tmp/debug-screenshot.png', fullPage: true });
      // console.log('📸 Screenshot saved');

      let html = await page.content();
      console.log(`📄 Retrieved HTML length: ${html.length} characters`);

      // Log a preview of the HTML
      console.log(`👀 HTML preview (first 500 chars): ${html.substring(0, 500)}...`);

      // Check if we have meaningful content
      if (contentInfo.bodyTextLength < 100) {
        console.warn('⚠️ Warning: Very little text content detected. The page might not have rendered properly.');
      }

      // Strip script tags and manifest links
      const originalLength = html.length;
      html = html.replace(/<script\b[^>]*>[\s\S]*?<\/script>/gi, '');
      html = html.replace(/<link\b[^>]*rel=["']manifest["'][^>]*>/gi, '');
      console.log(`✂️  Removed scripts, HTML length changed: ${originalLength} -> ${html.length}`);
      
      const status = response.status();
      const headers = response.headers();
      
      console.log(`✅ Render completed successfully. Status: ${status}, Final HTML length: ${html.length}`);
      return { html, status, headers: this.pickResponseHeaders(headers) };
    } catch (error) {
      console.error('💥 Error during rendering:', error);
      throw error;
    } finally {
      console.log('🧹 Closing page...');
      await page.close({ runBeforeUnload: false });
    }
  }

  private async applyWaitStrategy(page: Page, wait: WaitStrategy): Promise<void> {
    console.log(`⏰ Wait strategy: ${wait.type}, timeout: ${wait.timeoutMs}ms`);
    
    if (wait.type === 'network-idle') {
      console.log('📶 Waiting for network idle...');
      try {
        await page.waitForNetworkIdle({ idleTime: 1000, timeout: wait.timeoutMs });
        console.log('✅ Network idle achieved');
      } catch (error) {
        console.log('⚠️ Network idle wait completed (may have timed out)');
      }
      return;
    }
    
    if (wait.type === 'selector') {
      console.log(`🔍 Waiting for selector: ${wait.selector}`);
      try {
        await page.waitForSelector(wait.selector, { timeout: wait.timeoutMs });
        console.log('✅ Selector found');
      } catch (error) {
        console.log('⚠️ Selector wait completed (may have timed out)');
      }
      return;
    }
    
    console.log(`⏱️  Waiting for timeout: ${wait.timeoutMs}ms`);
    await new Promise<void>(resolve => setTimeout(resolve, wait.timeoutMs));
    console.log('✅ Timeout wait completed');
  }

  private pickResponseHeaders(headers: Record<string, string>): Record<string, string> {
    const allow = ['content-type', 'cache-control', 'etag', 'last-modified'];
    const out: Record<string, string> = {};
    for (const k of allow) {
      if (headers[k]) out[k] = headers[k];
    }
    out['x-prerendered'] = '1';
    return out;
  }
}
