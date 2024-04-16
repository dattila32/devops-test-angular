FROM node:16-alpine AS build

WORKDIR /app

COPY . .

RUN npm install -g npm@10.5.2`

RUN apk add --update python3 make g++ && rm -rf /var/cache/apk/*

RUN npm install

RUN npm run build

# Serve Application using Nginx Server

FROM nginx:alpine

COPY --from=build /app/dist/devops-test-angular/ /usr/share/nginx/html

EXPOSE 80
