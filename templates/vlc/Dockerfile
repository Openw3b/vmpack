FROM base-ubuntu

# Define package and command
ARG PACKAGES='vlc'
ARG COMMAND=vlc

# Install and add to start
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends $PACKAGES
RUN echo $COMMAND";sudo poweoff" > /opt/app.sh