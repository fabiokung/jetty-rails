module JettyRails
  
  class Runner
    attr_accessor :config
    
    def initialize(config = {})
      self.config = config
    end
    
    def start
      server = Jetty::Server.new 8080
      resources = Jetty::Handler::ResourceHandler.new
      resources.resource_base = config[:base] + '/public'
      
      root = Jetty::Handler::WebAppContext.new("/", "/")
      root.resource_base = config[:base]
      root.init_params = {
        'rails.root' => '/',
        'public.root' => '/public',
        'rails.env' => 'development',
        'gem.path' => 'tmp/war/WEB-INF/gems'
      }
      root.add_event_listener(Rack::RailsServletContextListener.new)
      root.add_filter(rack_filter, "/*", Jetty::Context::DEFAULT)
      
      server.add_handler(resources)
      server.add_handler(root)
      server.start
      server.join
    end
    
    private
    def rack_filter
      Jetty::FilterHolder.new Rack::RackFilter.new
    end
  end
end
