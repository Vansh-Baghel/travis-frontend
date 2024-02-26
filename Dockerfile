FROM node:alpine as builder

WORKDIR /app

COPY package*.json /app/

RUN npm i

COPY . .

# Note how we are using npm run build, to buit .next file
RUN npm run build

FROM nginx
WORKDIR /usr/share/nginx/html

EXPOSE 80

COPY --from=builder /app/.next .