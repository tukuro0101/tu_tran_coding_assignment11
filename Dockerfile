# Use the official Node.js image as the base image
FROM node:14

# Set the working directory inside the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json files
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Build the React application
RUN npm run build

# Install a simple server to serve the built application
RUN npm install -g serve

# Set the environment variable to use port 7775
ENV PORT 7775

# Expose the port the app runs on
EXPOSE 7775

# Command to run the application
CMD ["serve", "-s", "build"]
