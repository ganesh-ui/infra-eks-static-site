# Use official NGINX as the base image
FROM nginx:latest

# Remove the default NGINX HTML files
RUN rm -rf /usr/share/nginx/html/*

# Copy static website files (HTML, CSS, JS) into the NGINX web directory
COPY . /usr/share/nginx/html

# Expose port 80 to allow traffic to reach the website
EXPOSE 80

# Start NGINX in the foreground
CMD ["nginx", "-g", "daemon off;"]
