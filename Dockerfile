FROM node:alpine as builder

WORKDIR /app

COPY package*.json /app/

RUN npm install

COPY . .

# Note how we are using npm run build, to buit .next file
CMD ["npm", "run", "build"]  

FROM nginx
WORKDIR /usr/share/nginx/html
RUN apk add --no-cache npm

EXPOSE 80

COPY --from=builder /app/.next .