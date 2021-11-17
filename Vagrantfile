Vagrant.configure("2") do |config| 

	config.vm.define :clienteFw do |clienteFw|
	   clienteFw.vm.box = "bento/centos-7.9"
	   clienteFw.vm.network :private_network, ip: "209.191.60.2"
	   clienteFw.vm.hostname = "clienteFw"
	   clienteFw.vm.box_download_insecure = true
	end
	config.vm.define :firewallST do |firewallST|
	  firewallST.vm.box = "bento/centos-7.9"
	  firewallST.vm.network :private_network, ip: "209.191.70.3"
	  firewallST.vm.network :public_network, ip: "192.168.70.3"
      firewallST.vm.provision "shell", path: "Provisionfirewall.sh"
	  firewallST.vm.hostname = "firewallST"
	  firewallST.vm.box_download_insecure = true
	end
	config.vm.define :servidorST do |servidorST|
	  servidorST.vm.box = "bento/centos-7.9"
	  servidorST.vm.network :private_network, ip: "192.168.70.4"
      servidorST.vm.provision "shell", path: "configStremea.sh"
 	  servidorST.vm.hostname = "servidorST"
	  servidorST.vm.box_download_insecure = true
	end
end 
