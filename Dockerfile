FROM node:14.15.0-alpine3.12 as buildintrfront
ARG NPM_ENV=developement
WORKDIR /app
COPY ./package*.json ./
RUN npm install
COPY ./ ./
RUN npm run build:${NPM_ENV}    

FROM nginx:alpine

COPY --from=buildintrfront /app/build/ /usr/share/nginx/html

EXPOSE 80
