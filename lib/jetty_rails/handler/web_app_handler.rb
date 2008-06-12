module JettyRails
  module Handler
    class WebAppHandler < Jetty::Handler::WebAppContext
      attr_reader :config, :adapter
      
      def initialize(config)
        super("/", config[:context_path])
        @config = config

        self.class_loader = JRuby.runtime.jruby_class_loader
        self.resource_base = config[:base]
    
        @adapter = adapter_for(config[:adapter])
        self.init_params = @adapter.init_params
        
        @adapter.event_listeners.each do |listener|
          add_event_listener(listener)
        end

        add_filter(rack_filter, "/*", Jetty::Context::DEFAULT)
      end
  
      def self.add_adapter(adapter_key, adapter)
        adapters[adapter_key] = adapter
      end
  
      def self.adapters
        @adapters ||= {
          :rails => JettyRails::Adapters::RailsAdapter,
          :merb => JettyRails::Adapters::MerbAdapter
        }
      end
      
      def adapters
        self.class.adapters
      end
  
      protected
  
      def rack_filter
        Jetty::FilterHolder.new(Rack::RackFilter.new)
      end
  
      def adapter_for(kind)
        adapters[kind.to_sym].new(@config)
      end
    end
  end
end
