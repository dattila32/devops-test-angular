FROM node:16-alpine as build

WORKDIR /app

RUN apk add --no-cache python3 make g++

RUN npm install

COPY . .

RUN npm run build

# Serve Application using Nginx Server

FROM nginx:alpine

# copy the custom nginx configuration file to the container in the
# default location
COPY nginx.conf /etc/nginx/conf.d/default.conf

COPY --from=build /app/dist/devops-test-angular/ /usr/share/nginx/html

EXPOSE 80
