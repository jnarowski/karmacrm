require "active_resource"

module Karmacrm
  class Base < ActiveResource::Base

    class << self
      def api_key=(api_key)
        @@api_key = api_key
      end

      def api_key
        @@api_key ||= ""
      end

      def api_version
        @@api_version ||= "1"
      end

      def format
        @@format ||= ActiveResource::Formats::JsonFormat
      end

      def site=(site_url)
        self.prefix = "/api/v#{api_version}/"
        self.include_root_in_json = true
        super(site_url)
      end

      def config
        yield self
      end

      alias :instantiate_collection_orig :instantiate_collection

      def instantiate_collection(collection, prefix_options = {})
        collection = collection[collection_name] if collection.is_a? Hash
        instantiate_collection_orig(collection, prefix_options)
      end
      
      def find(*args)
        scope = args.slice!(0)
        options = args.slice!(0) || {}

        if options[:params].is_a? Hash
          options[:params][:api_key] = api_key
        else
          options.merge!({:params => {:api_key => api_key}})
        end
        
        items = super(scope, options)
      end

      def delete(id, options = {})
        options[:api_key] = api_key
        super(id, options)
      end

    end

    def save
      prefix_options[:api_key] = self.class.api_key
      super
    end

  end
end
