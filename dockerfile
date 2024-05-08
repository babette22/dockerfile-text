# Use the httpd base image
FROM httpd

# Install wget and unzip
RUN apt-get update && apt-get install -y wget unzip

# Create a volume called saves
VOLUME /usr/local/apache2/htdocs/saves

# Set working directory
WORKDIR /usr/local/apache2/htdocs/

# Remove everything in the working directory
RUN rm -rf *

# Download and unzip the code
RUN wget https://linux-devops-course.s3.amazonaws.com/halloween.zip && \
    unzip halloween.zip && \
    mkdir -p /usr/local/apache2/htdocs/saves && \
    mv halloween/* /usr/local/apache2/htdocs/saves && \
    rm -rf halloween.zip halloween

# Open port 80 on the container
EXPOSE 80
