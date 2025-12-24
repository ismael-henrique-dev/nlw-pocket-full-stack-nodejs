# Build stage
FROM node:20-alpine AS builder

# Set working directory
WORKDIR /app

# Copy package files
COPY package*.json ./

# Install dependencies
RUN npm ci 

# Copy source code
COPY . .

# 4. Rodar o build (vai gerar a pasta dist)
RUN npm run build && npx drizzle-kit migrate

# Expose port
EXPOSE 3333

# Start the application
CMD ["node", "http/server.js"]