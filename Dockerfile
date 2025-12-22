FROM node:20

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build

EXPOSE 3333

ENV DATABASE_URL="postgresql://docker:docker@localhost:5432/connect"

CMD ["npm", "start"]
