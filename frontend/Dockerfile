# == Build Stage =================
FROM node:16-alpine AS build

WORKDIR /app

COPY package*.json ./

RUN npm i

COPY . .

# RUN npm run build
CMD [ "npm", "start" ]
# == Production Stage =============
# FROM nginx:stable-alpine

# COPY --from=build /app/build/ /usr/share/nginx/html

# EXPOSE 3000