sudo apt-get update -y
sudo apt-get install -y curl

echo "127.0.1.1 traefik-k3s" >> /etc/hosts

sudo curl -L "https://get.k3s.io" -o /tmp/k3s_installer.sh

export INSTALL_K3S_VERSION="v1.20.4+k3s1" && \
export INSTALL_K3S_EXEC="server --tls-san traefik-k3s --bind-address=10.0.0.30 --advertise-address=10.0.0.30 --node-ip=10.0.0.30 --no-deploy=traefik --no-deploy servicelb" && \
sh /tmp/k3s_installer.sh

