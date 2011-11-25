$:.unshift File.join(File.expand_path("../..", __FILE__), "lib")

require "karmacrm_client"

KarmacrmClient::Base.config do |conf|
  conf.site = "http://localhost:3000"
  conf.prefix = "/api/v1/"
  conf.format = :json
  conf.api_key = 'eJogN2yuam5YV-v2_l3f'
end

# Can be set directly too
KarmacrmClient::Base.api_key = 'eJogN2yuam5YV-v2_l3f'
