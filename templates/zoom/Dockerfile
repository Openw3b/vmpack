FROM ubuntu

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends -y dhcpcd5 util-linux systemd systemd-sysv
RUN DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends -y xorg
RUN apt-get install -y --no-install-recommends spice-vdagent i3-wm
RUN apt-get install -y --no-install-recommends xterm sudo wget

RUN systemctl disable gdm

ARG COMMAND=zoom
RUN wget https://zoom.us/client/latest/zoom_amd64.deb -O /tmp/zoom_amd64.deb 
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y /tmp/zoom_amd64.deb
RUN rm /tmp/zoom_amd64.deb

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

#RUN echo 'exec --no-startup-id sudo /harden.sh' >> /etc/i3/config
#COPY files/harden.sh /harden.sh
#RUN echo 'user ALL = NOPASSWD: /harden.sh' > /etc/sudoers