echo "mysql-server mysql-server/root_password password vagrant" | sudo debconf-set-selections
echo "mysql-server mysql-server/root_password_again password vagrant" | sudo debconf-set-selections
sudo aptitude $V_APTITUDE_FLAGS install mysql-client mysql-server