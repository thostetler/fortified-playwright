FROM browserless/chrome:latest

# Use root to install stuff and fix permissions
USER root

# Optional: install tools
RUN apt-get update && apt-get install -y curl && rm -rf /var/lib/apt/lists/*

# Set up working directory with correct ownership
RUN mkdir -p /home/chrome/app && chown -R 1000:1000 /home/chrome/app

# Drop to the non-root user that *does* exist
USER chrome
WORKDIR /home/chrome/app

# Install extra packages
RUN npm init -y && \
    npm install playwright-extra playwright-extra-plugin-stealth

# Copy function script
COPY function-script.js /usr/src/app/function-script.js
