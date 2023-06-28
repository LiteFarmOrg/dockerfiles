FROM node:18.16.1

# zip
RUN set -e; \
    apt-get update && \
    apt-get install -y zip && \
    rm -rf /var/lib/apt/lists/* && \
# aws
    curl -L "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
    unzip awscliv2.zip && \
    ./aws/install && \
    aws --version

CMD ["node"]
