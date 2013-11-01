sudo add-apt-repository -y ppa:ondrej/mysql-5.6
sudo aptitude $V_APTITUDE_FLAGS update

echo "mysql-server mysql-server/root_password password vagrant" | debconf-set-selections
echo "mysql-server mysql-server/root_password_again password vagrant" | debconf-set-selections

sudo aptitude $V_APTITUDE_FLAGS install mysql-server
sudo aptitude $V_APTITUDE_FLAGS install mysql-client