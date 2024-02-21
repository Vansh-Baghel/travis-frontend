FROM node:alpine as builder

WORKDIR /app

COPY package*.json /app

RUN npm i

COPY . .

CMD ["npm", "run", "dev"]

FROM nginx
COPY --from=builder /app/.next /usr/share/nginx/html
