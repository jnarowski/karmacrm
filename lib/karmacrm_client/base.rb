require "active_resource"

module KarmacrmClient
  class Base < ActiveResource::Base

    class << self
      def api_key=(api_key)
        @@api_key = api_key
      end

      def api_key
        @@api_key ||= ""
      end

      def format
        @@format ||= ActiveResource::Formats::JsonFormat
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
        options.merge!({:params => {:api_key => api_key}})
        
        items = super(scope, options)
      end
    end
    
  end
end
