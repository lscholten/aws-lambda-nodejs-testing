# Maintainer: Luuk Scholten <luuk@luukscholten.nl>

FROM atlassian/default-image:latest

# Install python, pip for moto
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y python-pip

# Install supervisord
RUN apt-get install -y supervisor
RUN mkdir -p /var/run/moto_ses /var/run/moto_s3 /var/log/supervisor

# Install moto
RUN pip install moto

# Install local dynamodb
COPY dynamo /opt/dynamo


COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
 
EXPOSE 4568 4567 4569
