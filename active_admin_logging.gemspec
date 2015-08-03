# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'active_admin_logging/version'

Gem::Specification.new do |spec|
  spec.name = "active_admin_logging"
  spec.version = ActiveAdminLogging::VERSION
  spec.authors = ["Pavan Agrawal"]
  spec.email = ["pavan.agrawala@gmail.com"]
  spec.summary = %q{Addon for Active Admin for Admin Activity tracker.}
  spec.description = %q{On production, if we have couple of admin who is managing your site content/moderation, its difficult to see who has changed what/when. This tool will help you to track them. Also, no one can remove the History ;-) }
  spec.homepage = ""
  spec.license = "MIT"

  spec.files = `git ls-files -z`.split("\x0")
  spec.executables = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "active_admin" #, github: 'activeadmin'
  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_dependency "rails", "~> 4.2"
end
