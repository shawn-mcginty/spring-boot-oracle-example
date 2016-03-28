VAGRANTFILE_API_VERSION = "2"
ENV['VAGRANT_DEFAULT_PROVIDER'] = 'virtualbox'

port_to_forward = ENV['VAGRANT_PORT'] || 1521

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "centos-6.5-x86_64"
  config.vm.box_url = "https://dl.dropboxusercontent.com/s/np39xdpw05wfmv4/centos-6.5-x86_64.box"
  config.vm.box_check_update = true
  config.vm.provider "virtualbox" do |vm|
    vm.memory = 4096
  end

  config.vm.network "forwarded_port", guest: 1521, host: port_to_forward, auto_correct: true
  config.vm.provision :shell,
    :inline => "/bin/bash /vagrant/swap.sh"
  config.vm.provision :shell,
    :inline => "rm -rf /vagrant/oracle-installer/Disk1"
  config.vm.provision :shell,
    :inline => "unzip -q /vagrant/oracle-installer/oracle-xe-11.2.0-1.0.x86_64.rpm.zip"
  config.vm.provision :shell,
    :inline => "rpm -ivh Disk1/oracle-xe-11.2.0-1.0.x86_64.rpm"
end


# used to detect if running on linux
module OS
    def OS.windows?
        (/cygwin|mswin|mingw|bccwin|wince|emx/ =~ RUBY_PLATFORM) != nil
    end

    def OS.mac?
        (/darwin|mac os/ =~ RUBY_PLATFORM) != nil
    end

    def OS.unix?
        !OS.windows?
    end

    def OS.linux?
        OS.unix? and not OS.mac?
    end
end