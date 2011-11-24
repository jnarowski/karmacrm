# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "karmacrm_client/version"

Gem::Specification.new do |s|
  s.name        = "karmacrm_client"
  s.version     = KarmacrmClient::VERSION
  s.authors     = ["Bosko Ivanisevic"]
  s.email       = ["bosko.ivanisevic@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{KarmaCRM client library}
  s.description = %q{KarmaCRM API client library}

  s.rubyforge_project = "karmacrm_client"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here
  s.add_dependency "activeresource", "2.3.11"
end
