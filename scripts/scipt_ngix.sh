sudo apt update
sudo apt install -y nginx


echo "------------- comprovando si nginx fue instalado -------------"
sudo systemctl status nginx
