# == Build Stage =================
FROM node:16-alpine AS build
# -- Main dir --------------------
WORKDIR /app
# -- Set env ---------------------
ARG REACT_APP_BASE_URL
ENV REACT_APP_BASE_URL=$REACT_APP_BASE_URL
# -- Copy main files -------------
COPY package*.json ./
# -- Install main dependencies ---
RUN npm ci
# -- Copy necessary directories --
COPY build .
COPY node_modules .
COPY public .
COPY src .
# -- Build the project ------------
RUN npm run build
# == Production Stage =============
FROM nginx:stable-alpine3.20-slim
# -- Copy the dir 'build' to nginx --
COPY --from=build /app/build/ /usr/share/nginx/html
# -- Re-write and copy nginx configuration file --
COPY nginx/nginx.conf /etc/nginx/conf.d/default.conf
# -- Set a port for application ---
EXPOSE 80
# -- Start a nginx in the foreground process --
CMD ["nginx", "-g", "daemon off;"]
