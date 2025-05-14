FROM ghcr.io/browserless/chromium:latest

RUN npm install playwright-extra playwright-extra-plugin-stealth
