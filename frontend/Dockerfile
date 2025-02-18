# == Build Stage =================================
FROM node:16-alpine AS build

WORKDIR /app

ARG REACT_APP_BASE_URL=http://backend:8080
ENV REACT_APP_BASE_URL=$REACT_APP_BASE_URL

COPY package*.json ./
RUN npm ci
COPY . .

RUN npm run build
# == Production Stage ==============================
FROM nginx:stable-alpine3.20-slim

COPY --from=build /app/build/ /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
