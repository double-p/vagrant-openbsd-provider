require "vagrant"

module VagrantPlugins
  module ProviderOpenBSD
    module Errors
      class VagrantProviderOpenBSDError < Vagrant::Errors::VagrantError
        error_namespace('vagrant_openbsd_provider.errors')
      end

      class SystemVersionIsTooLow < VagrantProviderOpenBSDError
        error_key(:system_version_too_low)
      end

      class SystemCPUincapable < VagrantProviderOpenBSDError
        error_key(:system_cpu_incapable)
      end

    end
  end
end
