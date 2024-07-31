FROM node:20.16.0-alpine3.20 AS builder

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Build the React app
RUN npm run build

# Stage 2: Serve the React app
FROM node:18-slim

# Install `serve` to serve the React app
RUN npm install -g serve

# Set working directory
WORKDIR /app

# Copy the built React app from the previous stage
COPY --from=builder /app/dist ./dist

# Expose the port the app runs on
EXPOSE 5000

# Start the React app using `serve`
CMD ["serve", "-s", "dist", "-l", "5000"]
