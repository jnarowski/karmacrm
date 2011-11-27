require "yaml"
require "test/unit"
require "karmacrm_client"

test_cfg = YAML.load_file(File.join(File.expand_path("../", __FILE__), "test_config.yml"))
KarmacrmClient::Base.config do |config|
  config.site = test_cfg[:site]
  config.prefix = "/api/v1/"
  config.format = :json
  config.api_key = test_cfg[:api_key]
  config.logger = Logger.new(STDOUT) if test_cfg[:verbose] == true
end
  
