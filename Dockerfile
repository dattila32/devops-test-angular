FROM node:16-alpine

WORKDIR /app

COPY . .

RUN apk add --no-cache python3 make g++

RUN npm install

RUN npm run build

# Serve Application using Nginx Server

FROM nginx:alpine

COPY --from=build /app/dist/devops-test-angular/ /usr/share/nginx/html

EXPOSE 80
