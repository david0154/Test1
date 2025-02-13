# Use an official Ubuntu base image
FROM ubuntu:latest

# Install necessary dependencies
RUN apt-get update && apt-get install -y \
    git \
    curl \
    build-essential \
    clang \
    sudo

# Clone Arya programming language from GitHub
RUN git clone https://github.com/david0154/Arya.git /Arya

# Change directory to the Arya repository's root (where install.sh is located)
WORKDIR /Arya

# Run the install.sh script
RUN sudo bash install.sh

# Set working directory to the app directory (where your .aya files are located)
WORKDIR /app
COPY . /app

# Run the Arya program
CMD ["arya", "run", "app.aya"]
