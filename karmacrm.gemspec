# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "karmacrm/version"

Gem::Specification.new do |s|
  s.name        = "karmacrm"
  s.version     = Karmacrm::VERSION
  s.authors     = ["John Paul Narowski"]
  s.email       = ["jp@karmacrm.com"]
  s.homepage    = ""
  s.summary     = %q{KarmaCRM client library}
  s.description = %q{KarmaCRM API client library}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here
  s.add_dependency "activeresource", "2.3.12"
  s.add_dependency "rake", "0.8.7"
end
