# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "d3_mpq/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "d3_mpq"
  s.version     = D3MPQ::VERSION
  s.authors     = ["Patrick Helm"]
  s.email       = ["deradon87@gmail.com"]
  s.homepage    = "https://github.com/Deradon/d3_mpq"
  s.summary     = '"Diablo 3" data mining'
  s.description = "Parsing data out of Diablo 3."

  s.executables   = ["d3_mpq"]
  s.files         = Dir["{bin,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files    = Dir["{spec}/**/*"]
  s.require_paths = ["lib"]

  s.add_dependency "bindata"
  s.add_dependency "nokogiri"

  s.add_development_dependency "rspec"
  s.add_development_dependency "guard"
  s.add_development_dependency "guard-rspec"
  s.add_development_dependency "libnotify"

end

