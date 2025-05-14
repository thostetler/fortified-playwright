FROM browserless/chrome:latest

USER root

# Optional: ensure dependencies are up to date
RUN apt-get update && apt-get install -y curl && rm -rf /var/lib/apt/lists/*

USER chrome

# Set working dir and install Node deps
WORKDIR /home/chrome/app

RUN npm init -y && \
    npm install playwright-extra playwright-extra-plugin-stealth

# Copy custom function script
COPY function-script.js /usr/src/app/function-script.js
