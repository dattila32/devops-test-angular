FROM nginx:alpine

COPY /dist/devops-test-angular /usr/share/nginx/html

EXPOSE 80
