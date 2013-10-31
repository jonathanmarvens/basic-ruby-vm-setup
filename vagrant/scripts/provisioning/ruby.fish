set provisioning_directory /vagrant/scripts/provisioning/ruby
set rvm_directory $HOME/.rvm
set rvm_prerequisites "bunzip2" "curl" "git" "gunzip" "sed" "svn" "tar"
set rvm_rubies "1.9.3" "2.0.0"
set rvm_default_ruby $rvm_rubies[2]
set tools_to_install

function install_bunzip2
  sudo aptitude $V_APTITUDE_FLAGS install bzip2
end

function install_curl
  sudo aptitude $V_APTITUDE_FLAGS install curl
end

function install_git
  sudo aptitude $V_APTITUDE_FLAGS install git
end

function install_gunzip
  sudo aptitude $V_APTITUDE_FLAGS install gzip
end

function install_sed
  sudo aptitude $V_APTITUDE_FLAGS install sed
end

function install_svn
  sudo aptitude $V_APTITUDE_FLAGS install subversion
end

function install_tar
  sudo aptitude $V_APTITUDE_FLAGS install tar
end

for tool in $rvm_prerequisites
  set tool_path (which $tool)

  if test $status = 1
    set tools_to_install $tools_to_install $tool
  end
end

for tool in $tools_to_install
  eval install_$tool
end

cd $HOME
cp /vagrant/templates$HOME/.gemrc ./
cp /vagrant/templates$HOME/.rvmrc ./
cd -

mkdir -p $rvm_directory
cd $rvm_directory
tar -x -f $provisioning_directory/rvm-stable.tar.gz --strip-components=1 -z
chmod +x ./install
./install --auto-dotfiles
cd -

rvm autolibs packages

for ruby in $rvm_rubies
  and rvm install $ruby
  and rvm use $ruby
  and gem install bundler
  and gem install capistrano
  and gem install foreman
  and gem install pry # Just because I can't live without you :) ... I <3 you Pry.
  and gem install rake
end

rvm use --default $rvm_default_ruby