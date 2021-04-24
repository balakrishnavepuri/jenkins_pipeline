# The line below states we will base our new image on the Latest Official Ubuntu 
FROM ubuntu:18.04
 

# Identify the maintainer of an image
LABEL maintainer="tejaswimuvva22@gmail.com"
 

# Update the repository
RUN apt-get update && apt-get upgrade -y

# Install necessary tools
RUN apt-get install -y nano wget dialog net-tools

# Download and Install Nginx
RUN apt-get install -y nginx  

# Expose ports
EXPOSE 80
# Copy required files.
COPY index.html /usr/share/nginx/html/index.html


