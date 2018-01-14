
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "wikiranger/version"

Gem::Specification.new do |spec|
  spec.name          = "wikiranger"
  spec.version       = Wikiranger::VERSION
  spec.authors       = ["Michael Henriksen"]
  spec.email         = ["michenriksen@neomailbox.ch"]

  spec.summary       = %q{Gather information on Wiki contributions from IP ranges}
  spec.description   = %q{Gather information on Wiki contributions from IP ranges}
  spec.homepage      = "https://github.com/michenriksen/wikiranger"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "ruby-progressbar", "~> 1.9"
  spec.add_dependency "colorize", "~> 0.8.1"

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
end
