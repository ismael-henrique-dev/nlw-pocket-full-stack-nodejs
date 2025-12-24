# Build stage
FROM node:20-alpine AS builder

# Set working directory
WORKDIR /app

# Copy package files
COPY package*.json ./

# Install dependencies
RUN npm ci && npm run build && npx drizzle-kit migrate

# Copy source code
COPY . .

# Expose port
EXPOSE 3333

# Start the application
CMD ["node", "http/server.js"]