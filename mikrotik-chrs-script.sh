#!/bin/bash

# Step 1: Download the MikroTik CHR image
# The image file is downloaded from the official MikroTik website and saved as chr.img.zip
wget https://download.mikrotik.com/routeros/7.6/chr-7.6.img.zip -O chr.img.zip \
  && echo "CHR image downloaded successfully." \

# Step 2: Extract the downloaded ZIP file to create the .img file
# The extracted image will be used to install the MikroTik CHR
  && gunzip -c chr.img.zip > chr.img \
  && echo "CHR image extracted successfully." \

# Step 3: Mount the extracted image
# The image is mounted to the /mnt directory for configuration purposes
  && mount -o loop,offset=512 chr.img /mnt \
  && echo "CHR image mounted successfully." \

# Step 4: Retrieve the system's network configuration
# Extract the system's IP address and gateway from the enp0s3 interface
  && ADDRESS=`ip addr show enp0s3 | grep global | cut -d' ' -f 6 | head -n 1` \
  && GATEWAY=`ip route list | grep default | cut -d' ' -f 3` \
  && echo "System network configuration retrieved: IP=$ADDRESS, Gateway=$GATEWAY." \

# Step 5: Configure MikroTik CHR settings
# Prepare the configuration script to set IP address, gateway, disable Telnet, and configure the admin user
  && echo "/ip address add address=$ADDRESS interface=[/interface ethernet find where name=ether1]
/ip route add gateway=$GATEWAY
/ip service disable telnet
/user set 0 name=admin password=xxxxxx" > /mnt/autorun.rsc \
  && echo "MikroTik CHR configuration script prepared." \

# Step 6: Sync the file system and write the image to the disk
# Write the extracted image to the /dev/sda1 partition and ensure the disk is synced
  && echo u > /proc/sysrq-trigger \
  && dd if=chr.img bs=1024 of=/dev/sda1 \
  && echo "CHR image written to /dev/sda1." \

# Step 7: Sync, delay, and reboot the system
# Synchronize disk, delay for 5 seconds, and reboot the system to apply changes
  && echo "sync disk" \
  && echo s > /proc/sysrq-trigger \
  && echo "Sleep 5 seconds" \
  && sleep 5 \
  && echo "Ok, reboot" \
  && echo b > /proc/sysrq-trigger
