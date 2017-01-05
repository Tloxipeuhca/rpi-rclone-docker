FROM hypriot/rpi-golang

MAINTAINER Tloxipeuhca <tloxipeuhca@gmail.com>

WORKDIR /root

COPY .rclone.conf /root/.rclone.conf

# Install dependencies
RUN apt-get update && apt-get install -y --no-install-recommends unzip wget
RUN wget http://downloads.rclone.org/rclone-current-linux-arm.zip
RUN unzip rclone-current-linux-arm.zip -d .
RUN mv /root/$(zipinfo -1 rclone-current-linux-arm.zip | grep "/$")/rclone /bin
RUN chmod 744 /bin/rclone

#Clean up
RUN apt-get remove wget unzip -y
