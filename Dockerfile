FROM node:20-slim AS base

# Install Chromium and required dependencies
RUN apt-get update && apt-get install -y \
  chromium \
  ca-certificates fonts-liberation libasound2 libatk-bridge2.0-0 libatk1.0-0 \
  libc6 libcairo2 libcups2 libdbus-1-3 libexpat1 libfontconfig1 libgcc1 \
  libgbm1 libglib2.0-0 libgtk-3-0 libnspr4 libnss3 libpango-1.0-0 \
  libpangocairo-1.0-0 libstdc++6 libx11-6 libx11-xcb1 libxcb1 libxcomposite1 \
  libxcursor1 libxdamage1 libxext6 libxfixes3 libxi6 libxrandr2 \
  libxrender1 libxss1 libxtst6 lsb-release wget xdg-utils \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY package.json tsconfig.json ./
RUN npm install --omit=dev --no-audit --no-fund && npm cache clean --force

COPY src ./src

RUN npm run build

ENV NODE_ENV=production \
    PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true \
    PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium

EXPOSE 3000

CMD ["node", "dist/index.js"]