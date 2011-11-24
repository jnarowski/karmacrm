require "active_resource"

module KarmacrmClient
  class Base < ActiveResource::Base
    def self.api_key=(api_key)
      @@api_key = api_key
    end

    def self.api_key
      @@api_key ||= ""
    end

    def self.find(*args)
      scope = args.slice!(0)
      options = args.slice!(0) || {}
      options.merge!({:params => {:api_key => api_key}})
      
      super(scope, options)
    end
    
  end
end
