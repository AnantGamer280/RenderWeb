FROM ubuntu:latest

# Update & install necessary packages
RUN apt-get update && apt-get install -y \
    openssh-server \
    apache2 \
    tmate \
    && rm -rf /var/lib/apt/lists/*

# Set root password for SSH (change this for security)
RUN echo 'root:password' | chpasswd

# Create SSH directory
RUN mkdir /var/run/sshd

# Enable Apache service
RUN echo "Hello! Web & SSH are running." > /var/www/html/index.html

# Expose ports for SSH & Web
EXPOSE 80 22

# Start services and keep container alive
CMD service ssh start && apachectl -D FOREGROUND & tmate -F & tail -f /dev/null
