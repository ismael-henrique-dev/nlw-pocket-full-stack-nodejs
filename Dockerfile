# Build stage
FROM node:20-alpine

# Set working directory
WORKDIR /app

# Copiar arquivos de dependência
COPY package*.json ./

# Instalar dependências
RUN npm ci

# Copiar código fonte
COPY . .

# --- AQUI ESTAVA O ERRO ---
# Rodar APENAS o build. Não rode o migrate aqui.
RUN npm run build

# Expose port
EXPOSE 3333

# Start the application
# O comando sh -c permite rodar dois comandos em sequência:
# 1. Faz a migração (agora que tem acesso ao DATABASE_URL)
# 2. Inicia o servidor rodando o arquivo da pasta dist
CMD ["sh", "-c", "npx drizzle-kit migrate && node dist/http/server.js"]