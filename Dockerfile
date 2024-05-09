# Use an official Node runtime as a parent image
FROM node:16

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install backend dependencies
RUN npm install

# Bundle app source inside Docker image
COPY . .

# Build the React app
RUN cd frontend && npm install && npm run build

# Expose port to access server
EXPOSE 5000

# Define environment variable
ENV NODE_ENV production

# Run the app command
CMD ["node", "backend/server.js"]
