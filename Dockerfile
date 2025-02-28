FROM ubuntu:latest

# Update & install necessary packages
RUN apt-get update && apt-get install -y \
    openssh-server \
    apache2 \
    tmate \
    && rm -rf /var/lib/apt/lists/*

# Set root password for SSH
RUN echo 'root:password' | chpasswd

# Create SSH directory
RUN mkdir /var/run/sshd

# Apache default index.html
RUN echo "Hello! Web & SSH are running." > /var/www/html/index.html

# Expose ports
EXPOSE 80 22

# Volume for Persistent Data
VOLUME ["/data"]

# Start services and keep container alive
CMD service ssh start && apachectl -D FOREGROUND & tmate -F & tail -f /dev/null
