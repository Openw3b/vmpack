FROM base-ubuntu

# Define package and command
ARG PACKAGES='firefox'
ARG COMMAND=firefox

# Install and add to start
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends $PACKAGES
RUN echo $COMMAND";sudo poweroff" > /opt/app.sh