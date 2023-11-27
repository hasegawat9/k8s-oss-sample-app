# 1st stage
FROM node:18.9.0 AS build
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

# 2nd stage
FROM nginx:alpine
COPY --from=build /app/build /usr/share/nginx/html

