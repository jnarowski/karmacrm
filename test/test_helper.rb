require "yaml"
require "test/unit"
require "karmacrm"

test_cfg = YAML.load_file(File.join(File.expand_path("../", __FILE__), "test_config.yml"))
Karmacrm::Base.config do |config|
  config.site = test_cfg[:site]
  config.api_key = test_cfg[:api_key]
  config.logger = Logger.new(STDOUT) if test_cfg[:verbose] == true
end
