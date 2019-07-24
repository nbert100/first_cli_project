
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "first_cli_project/version"

Gem::Specification.new do |spec|
  spec.name          = "first_cli_project"
  spec.version       = FirstCliProject::VERSION
  spec.authors       = ["'Nia Bert'"]
  spec.email         = ["'nbert14@gmail.com'"]

  spec.summary       = %q{Learn more about the books on the NYT Best Seller List.}
  spec.description   = %q{The New York Times Best Seller Selector is a CLI, Command Line Interface, designed to give the user  more information about the books on the current Hardcover Fiction Best Seller List. The CLI scrapes data from the New York Times website to get information like book title, author, weeks on the best seller list and publisher. }
  spec.homepage      = "https://github.com/nbert100/first_cli_project"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "https://github.com/nbert100/first_cli_project.git"

    # spec.metadata["homepage_uri"] = spec.homepage
    # spec.metadata["source_code_uri"] = "TODO: Put your gem's public repo URL here."
    # spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "pry"
  spec.add_development_dependency 'nokogiri'
end
