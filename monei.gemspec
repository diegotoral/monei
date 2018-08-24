
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "monei/version"

Gem::Specification.new do |spec|
  spec.name          = "monei"
  spec.version       = Monei::VERSION
  spec.authors       = ["Diego Toral"]
  spec.email         = ["diegotoral@gmail.com"]

  spec.summary       = %q{Monei makes dealing with currencies simple.}
  spec.description   = %q{Monei is a simple yet fun to play around Ruby gem for dealing with currencies and conversion rates at a high abstraction level.}
  spec.homepage      = "https://github.com/diegotoral/monei"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "cucumber", "~> 3.1.0"
end
