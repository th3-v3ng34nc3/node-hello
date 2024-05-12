# Stage 1: Build the application
FROM node:latest as build

WORKDIR /app

COPY package.json .
COPY package-lock.json .

RUN npm install

COPY . .

# Stage 2: Create the production image
FROM node:alpine

WORKDIR /app

COPY --from=build /app .

EXPOSE 3000

CMD ["node", "index.js"]
