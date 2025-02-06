# Dockerfile for deploying Arya program on Render.com
FROM ubuntu:latest

# Install necessary dependencies for Arya
RUN apt-get update && apt-get install -y \
    git \
    build-essential \
    curl

# Install Arya programming language
RUN git clone https://github.com/david0154/Arya.git /arya
WORKDIR /arya
RUN make install

# Set working directory and copy the program
WORKDIR /app
COPY . /app

# Build and run the program
CMD ["arya", "run", "test.aya"]
