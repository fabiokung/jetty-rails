module JettyRails
  module Adapters
    
    class MerbAdapter
      attr_reader :config
      
      def initialize(config)
        @config = config
      end
      
      def init_params
        # please refer to goldspike and jruby-rack documentation
        @merb_params ||= {
          'merb.root' => '/',
          'public.root' => '/public',
          'merb.environment' => config[:environment],
          'gem.path' => 'tmp/war/WEB-INF/gems'
        }
      end
      
      def rack_event_listener
        Rack::MerbServletContextListener.new
      end
      
    end
    
  end
end