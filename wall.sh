#!/bin/bash
#====================================================
# SCRIPT: ELH SERVER QUICK DEPLOY FOR X-UI
# DEVELOPED BY: speedforce
# UPDATE DATE: 2023.08.08
# THIS REPO SPECIALLY MADE FOR ELH.NETWOXCLOUD SERVERS.
#====================================================

# Update System
sudo apt update 
# Upgrade System
sudo apt upgrade -y
# Install Firewalld
sudo apt-get install firewalld -y
# Open Ports
sudo firewall-cmd --zone=public --permanent --add-port=22/tcp #SSH
sudo firewall-cmd --zone=public --permanent --add-port=54321/tcp # User 1
sudo firewall-cmd --zone=public --permanent --add-port=54322/tcp # User 2
sudo firewall-cmd --zone=public --permanent --add-port=54323/tcp # User 3
sudo firewall-cmd --zone=public --permanent --add-port=54324/tcp # User 4
sudo firewall-cmd --zone=public --permanent --add-port=54325/tcp # User 5
sudo firewall-cmd --zone=public --permanent --add-port=54326/tcp # User 6
sudo firewall-cmd --zone=public --permanent --add-port=54327/tcp # User 7
sudo firewall-cmd --zone=public --permanent --add-port=54328/tcp # User 8
sudo firewall-cmd --zone=public --permanent --add-port=54329/tcp # User 9
sudo firewall-cmd --zone=public --permanent --add-port=54330/tcp # User 10
sudo firewall-cmd --zone=public --permanent --add-port=80/tcp # HTTP
sudo firewall-cmd --zone=public --permanent --add-port=443/tcp # HTTPs
# Reload Firewalld
sudo firewall-cmd --reload
# Adding Cron Jobs
(crontab -l && echo "#ELHX-UI") | crontab -
# (crontab -l && echo "@reboot sudo x-ui start") | crontab -
(crontab -l && echo "@reboot systemctl start firewalld") | crontab -
# Install Speedtest CLI
sudo apt install speedtest-cli
# Setup Time Zone
sudo timedatectl set-timezone Asia/Colombo
# Setup Automatic Reboot @ Every day 12 a.m.
(crontab -l && echo "0 0 * * * /sbin/reboot") | crontab -
# Remove Junk Files
sudo apt autoremove -y
# Automate Removing Junk Files 
sudo sh -c 'echo "sudo apt autoremove -y" >> /etc/cron.monthly/autoremove'
# Setup Monthly Junk Remover Job
sudo chmod +x /etc/cron.monthly/autoremove
# End
echo "Part 01 Done !"
# Remove opcmake file
rm -r part1
