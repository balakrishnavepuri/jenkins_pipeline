
# The line below states we will base our new image on the Latest Official Ubuntu 
FROM ubuntu:18.04
 

# Identify the maintainer of an image
LABEL maintainer="tejaswimuvva22@gmail.com"
 

# Update the image to the latest packages
RUN apt-get update && apt-get upgrade -y
 
#
# Install NGINX to test.
RUN apt-get install nginx -y
 

# Expose port 80
EXPOSE 80
 
# Copy required files.
 COPY . /usr/share/nginx/html


# Last is the actual command to start up NGINX within our Container
CMD ["nginx", "-g", "image created;"]
