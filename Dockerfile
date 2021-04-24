# The line below states we will base our new image on the Latest Official Ubuntu 
FROM ubuntu
 

# Identify the maintainer of an image
LABEL maintainer="balakrishnavepuri@gmail.com"


# Update the repository
RUN apt-get update

# Install necessary tools
RUN apt-get install -y nano wget dialog net-tools

# Download and Install Nginx
RUN apt-get install -y nginx  
# Copy required files.
COPY index.html /var/www/html/
# Expose ports
EXPOSE 80

# Set the default command to execute
# when creating a new container
CMD [ "nginx","-g","daemon off;" ]
