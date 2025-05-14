const { chromium } = require('playwright-extra');
const stealth = require('playwright-extra-plugin-stealth')();
chromium.use(stealth);

module.exports = async function ({ req, res }) {
  const browser = await chromium.launch({
    headless: true,
    args: [
      '--no-sandbox',
      '--disable-gpu',
      '--disable-blink-features=AutomationControlled',
      '--disable-dev-shm-usage',
      // any other custom args
    ]
  });

  const page = await browser.newPage();
  await page.goto('https://example.com');
  const title = await page.title();

  await browser.close();

  res.end(JSON.stringify({ title }));
};
