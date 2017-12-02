
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "vagrant-openbsd-provider/version"

Gem::Specification.new do |spec|
  spec.name          = "vagrant-openbsd-provider"
  spec.version       = VagrantPlugins::ProviderOpenBSD::VERSION
  spec.authors       = ["Philipp Buehler"]
  spec.email         = ["pbuehler@sysfive.com"]

  spec.summary       = %q{OpenBSD vmd(8) vagrant provider.}
  spec.description   = %q{his is a Vagrant 1.5+ plugin that adds an OpenBSD vmd(4) provider to Vagrant, allowing Vagrant to control and provision machines on OpenBSD.}
  spec.homepage      = "https://github.com/double-p/vagrant-openbsd-provider"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "vagrant-spec", "~> 1.4.0"
end
