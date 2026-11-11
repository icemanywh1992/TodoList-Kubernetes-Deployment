
# Build the React application
FROM node:22-slim AS build

WORKDIR /app

# Install all dependencies needed for the build
COPY package*.json ./
RUN npm ci

# Copy application files
COPY . .

# Build the React application
RUN npm run build:app

# Serve the compiled application
FROM nginx:stable-alpine

COPY --from=build /app/build /usr/share/nginx/html

EXPOSE 80
