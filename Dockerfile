FROM node:alpine as builder

WORKDIR /app

COPY package*.json /app/

RUN npm install

COPY . .

# Note how we are using npm run build, to buit .next file
CMD ["npm", "run", "build"]  

FROM nginx:alpine

# RUN apk add --no-cache npm

WORKDIR /usr/share/nginx/html

COPY --from=builder /app/.next .
