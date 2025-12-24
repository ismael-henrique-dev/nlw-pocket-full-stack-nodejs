FROM node:20-alpine

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build

ENV PORT=3333
EXPOSE 3333

CMD ["sh", "./start.sh"]
