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
          'gem.path' => ENV['GEM_PATH'] || 'tmp/war/WEB-INF/gems'
        }
      end
      
      def event_listeners
        [ Rack::MerbServletContextListener.new, SignalHandler.new ]
      end
      
      class SignalHandler
        include Java::JavaxServlet::ServletContextListener
        
        def contextInitialized(cfg)
          trap("INT") do
            puts "\nbye!"
            java.lang.System.exit(0)
          end
        end
        
        def contextDestroyed(cfg)
        end
      end
      
    end
  end
end