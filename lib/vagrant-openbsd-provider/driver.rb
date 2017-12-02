#require "log4r"
#require "fileutils"
#require "digest/md5"
#require "io/console"
#require "ruby_expect"


module VagrantPlugins
  module ProviderOpenBSD
    class Driver

      # This executor is responsible for actually executing commands, including
      # bhyve, dnsmasq and other shell utils used to get VM's state
      attr_accessor :executor

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
      end
      def import(machine, ui)
      end
      def load(machine, ui)
      end
      def boot(machine, ui)
      end
      def pf_enabled?
      end
      def ip_ready?
      end
      def ssh_ready?(ssh_info)
      end
      def create_network_device(device_name, device_type)
      end
      def enable_nat(bridge, ui)
      end
      def get_ip_address(interface_name, type=:guest)
      end
      def forward_port(forward_information, tap_device)
      end
      #lifecycle
      def state(vm_name)
      end
      def execute(*cmd, **opts, &block)
      end
      def get_mac_address(vm_name)
      end
      def get_interface_name(device_name)
      end
      def restart_service(service_name)
      end
      def get_attr(attr)
      end
      def pkg_install(package)
      end
      def store_attr(name, value)
      end
      def check_and_install(command, package, ui)
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
