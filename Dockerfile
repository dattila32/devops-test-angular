FROM node:18-alpine as build

WORKDIR /devops-test-angular

COPY . .

RUN apk add --no-cache python3 make g++

RUN npm install

RUN npm run build --prod

FROM nginx:72821/nginx-proxy

COPY nginx.conf /etc/nginx/conf.d/default.conf

COPY --from=build /devops-test-angular/dist/devops-test-angular/ /usr/share/nginx/html

EXPOSE 80

