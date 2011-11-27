$:.unshift File.join(File.expand_path("../..", __FILE__), "lib")

require "karmacrm"

Karmacrm::Base.config do |conf|
  conf.site = "http://localhost:3000"
  conf.api_key = 'eJogN2yuam5YV-v2_l3f'
end

# Can be set directly too
Karmacrm::Base.api_key = 'eJogN2yuam5YV-v2_l3f'
