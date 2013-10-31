VAGRANTFILE_API_VERSION = "2"

Vagrant.configure VAGRANTFILE_API_VERSION do |configure|
  configure.vm.box      = "ubuntu-12.04-amd64-server-cloudimg"
  configure.vm.box_url  = "http://cloud-images.ubuntu.com/vagrant/precise/current/precise-server-cloudimg-amd64-vagrant-disk1.box"
  configure.vm.hostname = "devbox"

  configure.vm.network :private_network, {
    ip: "10.96.48.24",
  }

  configure.vm.provider :virtualbox do |machine|
    machine.customize [
      "modifyvm",
      :id,
      "--accelerate3d",
      "off",
    ]
    machine.customize [
      "modifyvm",
      :id,
      "--cpus",
      "1",
    ]
    machine.customize [
      "modifyvm",
      :id,
      "--memory",
      "512",
    ]
    machine.customize [
      "modifyvm",
      :id,
      "--vtxvpid",
      "off",
    ]
  end

  configure.vm.provision :shell do |shell|
    # Cause I can bro.
    parameters      = {
      default_shell: "fish",
    }
    shell_arguments = []

    shell_arguments << "-a #{parameters[:default_shell]}"

    shell.args        = shell_arguments.join " "
    shell.path        = "vagrant/scripts/prepare.sh"
    shell.privileged  = false
    shell.upload_path = "/tmp/vagrant-prepare.sh"
  end

  configure.vm.provision :shell do |shell|
    shell.path        = "vagrant/scripts/main-setup.fish"
    shell.privileged  = false
    shell.upload_path = "/tmp/vagrant-main-setup.fish"
  end

  configure.vm.synced_folder "vagrant", "/vagrant"

  # TODO: Figure out why NFS doesn't work :( .
  # configure.vm.synced_folder "vagrant", "/vagrant", {
  #   nfs: true,
  # }
end