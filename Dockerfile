FROM node:18-alpine

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .

RUN rm -f eslint.config.mjs .eslintrc.json

RUN npm run build

EXPOSE 3000

CMD ["npm", "start"]