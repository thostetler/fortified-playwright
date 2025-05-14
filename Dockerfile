FROM browserless/chrome:latest

USER root

# Optional tools
RUN apt-get update && apt-get install -y curl && rm -rf /var/lib/apt/lists/*

WORKDIR /usr/src/app

# Install Playwright Extra
RUN npm install playwright-extra playwright-extra-plugin-stealth

# Copy the function override
COPY function-script.js /usr/src/app/function-script.js

# Fix ownership (use UID:GID instead of username)
RUN chown -R 1000:1000 /usr/src/app

# Keep using root or switch to UID directly if needed
# USER 1000
