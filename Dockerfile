# Use Node 18 as parent image
FROM node:18-alpine as application

# Change the working directory on the Docker image to /app
WORKDIR /app

# Copy package.json and package-lock.json to the /app directory
COPY package.json package-lock.json ./

# Install dependencies
RUN npm install

# Copy the rest of project files into this image
COPY . .

FROM application as final
RUN npm install --production
COPY . .
# Expose application port
EXPOSE 3000

# Start the application
CMD npm start
