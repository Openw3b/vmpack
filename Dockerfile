FROM ubuntu

RUN apt-get update && \
    apt-get install -y dhcpcd5 util-linux systemd systemd-sysv
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y xorg
RUN apt-get install -y spice-vdagent i3-wm
RUN apt-get install -y xterm sudo

RUN systemctl disable gdm

ARG PACKAGES='firefox mousepad'
ARG COMMAND=firefox

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y $PACKAGES

COPY files/init /init
RUN chmod +x /init

COPY files/xrandrloop.sh /opt/xrandrloop.sh
RUN chmod +x /opt/xrandrloop.sh

RUN mkdir -p /etc/systemd/system/getty@tty1.service.d
COPY files/override.conf /etc/systemd/system/getty@tty1.service.d/override.conf

COPY files/config /etc/i3/config
RUN echo $COMMAND' & while [[ -d /proc/$! ]]; do sleep 1; done; echo 2' > /opt/app.sh
RUN chmod +x /opt/app.sh
RUN echo 'exec --no-startup-id /opt/app.sh' >> /etc/i3/config

COPY files/.xinitrc /home/user/.xinitrc
COPY files/.bash_profile /home/user/.bash_profile

#COPY files/app.service /etc/systemd/system/app.service
#COPY files/app.service /lib/systemd/system/app.service
#RUN chmod 644 /etc/systemd/system/app.service
#RUN systemctl enable app
