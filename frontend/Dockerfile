# == Build Stage =================
FROM node:iron-alpine3.21 AS build

WORKDIR /app

COPY package*.json ./

RUN npm i

COPY . .

CMD [ "npm", "start" ]
# RUN npm run build
# == Production Stage =============
# FROM nginx:stable-alpine3.20-slim AS production

# COPY --from=build /app/build/ /usr/share/nginx/html

# EXPOSE 80
