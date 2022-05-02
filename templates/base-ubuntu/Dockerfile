# Build tools
FROM ubuntu:focal AS buildctr  

RUN mkdir /build
WORKDIR /build
RUN DEBIAN_FRONTEND=noninteractive apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y git build-essential libgtk-3-dev 
RUN git clone https://github.com/openw3b/dragon; cd dragon; make

# Setup base env
FROM ubuntu:focal

RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends -y dhcpcd5 util-linux systemd systemd-sysv
RUN DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends -y xorg
RUN apt-get install -y --no-install-recommends spice-vdagent i3-wm
RUN apt-get install -y --no-install-recommends xterm sudo pulseaudio
RUN systemctl disable gdm
RUN echo "user ALL = NOPASSWD: /usr/sbin/poweroff" >> /etc/sudoers

COPY files/init /init
COPY files/xrandrloop.sh /opt/xrandrloop.sh
COPY files/dnd.sh /usr/local/bin/xdg-open
COPY files/config /etc/i3/config
RUN touch /opt/app.sh
RUN chmod +x /opt/app.sh
RUN chmod +x /init
RUN chmod +x /opt/xrandrloop.sh
RUN chmod +x /usr/local/bin/xdg-open

RUN mkdir -p /etc/systemd/system/getty@tty1.service.d
COPY files/override.conf /etc/systemd/system/getty@tty1.service.d/override.conf

COPY files/config /etc/i3/config

RUN echo 'exec --no-startup-id /opt/app.sh' >> /etc/i3/config

RUN useradd -s /bin/bash -d /home/user/ -m -G sudo user
USER user
COPY files/.xinitrc /home/user/.xinitrc
COPY files/.bash_profile /home/user/.bash_profile
RUN mkdir /home/user/.dragon
RUN mkdir /home/user/.share
COPY --from=buildctr /build/dragon/dragon /usr/bin/dragon

USER root

# Allow sudo for user - Useful for debugging
#echo "user ALL = (ALL) NOPASSWD: ALL" >> /etc/sudoers

# Harden the container
#RUN echo 'exec --no-startup-id sudo /harden.sh' >> /etc/i3/config
#COPY files/harden.sh /harden.sh
#RUN echo 'user ALL = NOPASSWD: /harden.sh' >> /etc/sudoers