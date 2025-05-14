FROM browserless/chrome:latest

USER root

# System deps (optional)
RUN apt-get update && apt-get install -y curl && rm -rf /var/lib/apt/lists/*

# Ensure working directory exists and is owned by chrome user
RUN mkdir -p /home/chrome/app && chown -R chrome:chrome /home/chrome/app

USER chrome
WORKDIR /home/chrome/app

# Init and install your packages
RUN npm init -y && \
    npm install playwright-extra playwright-extra-plugin-stealth

# Copy custom script into place
COPY --chown=chrome:chrome function-script.js /usr/src/app/function-script.js
