FROM node:20-alpine

WORKDIR /app

RUN apk add --no-cache libc6-compat

COPY package*.json ./

RUN npm install --ignore-scripts

COPY . .

RUN rm -f next.config.ts eslint.config.mjs

RUN npm run build

EXPOSE 3000

CMD ["npm", "start"]