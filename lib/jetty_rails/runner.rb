require "jruby"

module JettyRails
  
  class Runner
    attr_reader :config
    attr_reader :server
    attr_reader :app_context
    
    def initialize(config = {})
      self.config = config
      
      @server = Jetty::Server.new 8080
      @resources = Jetty::Handler::ResourceHandler.new
      @resources.resource_base = config[:base] + '/public'
      @server.add_handler(@resources)
      
      @app_context = Jetty::Handler::WebAppContext.new("/", "/")
      @app_context.class_loader = JRuby.runtime.jruby_class_loader
      @app_context.resource_base = config[:base]
      @app_context.init_params = {
        'rails.root' => '/',
        'public.root' => '/public',
        'rails.env' => 'development',
        'gem.path' => 'tmp/war/WEB-INF/gems'
      }
      @app_context.add_event_listener(Rack::RailsServletContextListener.new)
      @app_context.add_filter(rack_filter, "/*", Jetty::Context::DEFAULT)
      
      server.add_handler(@app_context)
    end
    
    def start      
      @server.start
      @server.join
    end
    
    private
    def rack_filter
      Jetty::FilterHolder.new(Rack::RackFilter.new)
    end
  end
end
