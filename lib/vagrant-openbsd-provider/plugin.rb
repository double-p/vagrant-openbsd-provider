begin
  require "vagrant"
rescue LoadError
  raise "The OpenBSD provider must be run within Vagrant."
end

# This is a sanity check to make sure no one is attempting to install
# this into an early Vagrant version.
if Vagrant::VERSION < "1.1.0"
  raise "This OpenBSD provider is only compatible with Vagrant 1.1+"
end

module VagrantPlugins
  module Rackspace
    class Plugin < Vagrant.plugin("2")
      name "OpenBSD vmd(8)"
      description <<-DESC
      This plugin enables Vagrant to manage machines with OpenBSD's vmd(8)
      DESC

      config(:openbsd-provider, :provider) do
        require_relative "config"
        Config
      end

      provider(:openbsd-provider, { :box_optional => true, parallel: true}) do
        # Setup some things
        OpenBSDProvider.init_i18n
        OpenBSDProvider.init_logging

        # Load the actual provider
        require_relative "provider"
        Provider
      end

      command('openbsd-provider') do
        require_relative "command/root"
        Command::Root
      end
    end
  end
end
