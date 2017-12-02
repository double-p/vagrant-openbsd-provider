require "log4r"
#require "fileutils"
#require "digest/md5"
#require "io/console"
#require "ruby_expect"


module VagrantPlugins
  module ProviderOpenBSD
    class Driver

      #birth
      def initialize(machine)
        @logger = Log4r::Logger.new("vagrant_openbsd_provider::driver")
        @machine = machine
        @data_dir = @machine.data_dir
        @executor = Executor::Exec.new

        if Process.uid == 0
          @sudo = ''
        else
          @sudo = 'doas'
        end
      end

      def check_vmm_support
        result = File.exist?("/dev/vmm")
        raise Errors::SystemVersionIsTooLow if result == 0
        result = execute(true, "#{@sudo} /usr/sbin/rcctl -f check vmd"
        raise Errors::SystemCPUincapable if result == 1
      end

      def import(machine, ui)
        #do we need this, no img-based .box for now
      end

      def boot(machine, ui)
        directory   = @data_dir
        config      = machine.provider_config
        vmconfig    = machine.config
        image       = config.image

        vmctl_cmd = "#{@sudo} /usr/sbin/vmctl start -c -L "
        vmctl_cmd += "#{vmconfig.vm_name}" #XXX dump a vm-config-hash
        vmctl_cmd += " -b #{image}"
        vmctl_cmd += " -m #{config.memory}"
        vmctl_cmd += " -i #{config.nif}"
        #XXX need a hash, vmd can connect multiple; also this might come from a box
        # that has multiple IMGs (supported already?) - get it running with one first
        vmctl_cmd += " -d #{config.disk}"
      end

      def pf_enabled?
        return execute(true, "#{@sudo} /sbin/pfctl -si | grep Enabled") == 0
        return false
      end

      def ip_ready?
       #vm-id = tapN; ifconfig status 'UP' should be sufficient
      end

      def ssh_ready?(ssh_info)
        if ssh_info
          return execute(true, "nc -z #{ssh_info[:host]} #{ssh_info[:port]}") == 0
        end
        return false
      end

      def create_network_device(device_name, device_type)
      end

      def enable_nat(bridge, ui)
       # -L is doing that for us ; sysctl for forwarding?
       # inject anchor in pf.conf or let to user
       # use pfctl -a anyway
      end

      def get_ip_address(interface_name, type=:guest)
       # tapN having it or via switch/bridge?
      end

      def forward_port(forward_information, tap_device)
       # as enable_nat; forcefully inject or docs?
      end

      #lifecycle
      def state(vm_name)
       # vmctl status
      end

      def execute(*cmd, **opts, &block)
       # not needed?
      end

      def get_mac_address(vm_name)
       # tapN?
      end

      def get_interface_name(device_name)
       # implicit
      end

      # deathrays
      def shutdown(ui)
      end

      def destroy
      end

      def cleanup
      end
    end
  end
end
