# The line below states we will base our new image on the Latest Official Ubuntu 
FROM ubuntu
 

# Identify the maintainer of an image
LABEL maintainer="tejaswimuvva22@gmail.com"
 
# Install Nginx

# Add application repository URL to the default sources
RUN echo "deb http://archive.ubuntu.com/ubuntu/ raring main universe" >> /etc/apt/sources.list

# Update the repository
RUN apt-get update

# Install necessary tools
RUN apt-get install -y nano wget dialog net-tools

# Download and Install Nginx
RUN apt-get install -y nginx  

# Expose ports
EXPOSE 80
# Copy required files.
COPY index.html /usr/share/nginx/html/index.html

# Set the default command to execute
# when creating a new container
CMD [ "service nginx start" ]
