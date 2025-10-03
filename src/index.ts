import 'dotenv/config';
import { createServer } from './server.js';
import { loadConfig } from './config.js';

const config = loadConfig();
const app = createServer();

app.get('/', (_req, res) => res.status(200).send('Prerender service up'));

app.listen(config.port, () => {
  // eslint-disable-next-line no-console
  console.log(`Prerender service listening on :${config.port}`);
});


