CENTOS 7
sudo yum -y update
# Add New Root User
sudo useradd tecnico
sudo echo "Admin123" | passwd --stdin tecnico
sudo usermod -aG wheel tecnico
# Install Aditionals Packagas !important
sudo yum -y install epel-release
sudo yum -y groupinstall "X Window system" 
# Install Remote Desktop
sudo yum -y install xrdp
sudo systemctl start xrdp
sudo systemctl enable xrdp
# Firewall Forwarding
sudo firewall-cmd --permanent --add-port=3389/tcp
# Install Desktop - GUI
sudo yum -y groupinstall "Xfce"
sudo echo "xfce4-session" > /home/tecnico/.xsession
sudo chmod a+x /home/tecnico/.xsession
sudo systemctl set-default graphical.target
# Install Extra Utilities
sudo yum -y install firefox
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
sudo yum -y install docker
sudo systemctl start docker
sudo systemctl enable docker
sudo reboot
