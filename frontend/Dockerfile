# == Build Stage =================================
FROM node:16-alpine AS build

WORKDIR /app

ARG REACT_APP_BASE_URL
ENV REACT_APP_BASE_URL=$REACT_APP_BASE_URL

COPY package*.json ./
RUN npm i
COPY . .

RUN npm run build
# == Production Stage ==============================
FROM nginx:alpine

COPY --from=build /app/build /usr/share/nginx/html
COPY ./nginx/nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
