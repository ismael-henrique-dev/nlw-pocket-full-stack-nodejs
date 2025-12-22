FROM node

ARG DATABASE_URL

WORKDIR /app

COPY package*.json ./

ENV DATABASE_URL=$DATABASE_URL

ENV PORT=3333

RUN npm install

COPY . .

RUN npm run build

EXPOSE 3333

RUN npx drizzle-kit generate

CMD ["npm", "start"]

