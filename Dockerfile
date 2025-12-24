# Estágio 1: Build
FROM node:20-alpine AS builder

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .
RUN npm run build

# Estágio 2: Produção (Imagem final leve)
FROM node:20-alpine AS runner

WORKDIR /app

# Definir como produção para otimizar dependências
ENV NODE_ENV=production
ENV PORT=3333

# Copiar apenas o necessário para rodar
COPY package*.json ./
RUN npm install --omit=dev

# Copiar os arquivos do estágio anterior
COPY --from=builder /app/dist ./dist
# MUITO IMPORTANTE: O nome da sua pasta na imagem é .migrations
COPY --from=builder /app/.migrations ./.migrations 
COPY --from=builder /app/drizzle.config.ts ./
COPY --from=builder /app/start.sh ./

# Garantir permissão de execução
RUN chmod +x start.sh

EXPOSE 3333

CMD ["sh", "./start.sh"]