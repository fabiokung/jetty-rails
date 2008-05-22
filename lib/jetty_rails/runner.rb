require "jruby"

module JettyRails
  
  class Runner
    attr_reader :config
    attr_reader :server
    attr_reader :app_context
    
    @@defaults = {
      :adapter => :rails, 
      :environment => 'development',
      :context_path => '/',
      :port => 8080 
    }
    
    def initialize(config = {})
      @config = config.symbolize_keys!.reverse_merge!(@@defaults)
      add_root_method_to @config[:context_path]
      
      raise 'Basedir to be run must be provided' unless config[:base]
      
      @server = Jetty::Server.new
      connector = Jetty::SelectChannelConnector.new
      connector.port = config[:port]
      @server.add_connector(connector)
      
      add_public_dir_to server
      install_rack_on server
    end
    
    def start
      @server.start
      @server.join
    end
    
    private
    def add_public_dir_to(server)
      @resources = Jetty::Handler::ResourceHandler.new
      @resources.resource_base = config[:base] + '/public'
      context_capable = add_context_capability_to @resources
      delegate_on_error = JettyRails::Handler::DelegateOnErrorsHandler.new
      delegate_on_error.handler = context_capable
      server.add_handler(delegate_on_error)
    end
    
    def add_context_capability_to(handler)
      return handler if config[:context_path].root?
      context_handler = Jetty::Handler::ContextHandler.new(config[:context_path])
      context_handler.handler = @resources
      context_handler
    end
    
    def install_rack_on(server)
      @app_context = Jetty::Handler::WebAppContext.new("/", config[:context_path])
      @app_context.class_loader = JRuby.runtime.jruby_class_loader
      @app_context.resource_base = config[:base]
      
      if config[:adapter] == :rails
        # refer to goldspike and jruby-rack documentation
        @app_context.init_params = {
          'rails.root' => '/',
          'public.root' => '/public',
          'rails.env' => config[:environment],
          'gem.path' => 'tmp/war/WEB-INF/gems'
        }
        @app_context.add_event_listener(Rack::RailsServletContextListener.new)
      elsif config[:adapter] == :merb
        @app_context.init_params = {
          'merb.root' => '/',
          'public.root' => '/public',
          'merb.environment' => config[:environment],
          'gem.path' => 'tmp/war/WEB-INF/gems'
        }
        @app_context.add_event_listener(Rack::MerbServletContextListener.new)
      end
      
      @app_context.add_filter(rack_filter, "/*", Jetty::Context::DEFAULT)
      server.add_handler(@app_context)
    end
    
    def rack_filter
      Jetty::FilterHolder.new(Rack::RackFilter.new)
    end
    
    def add_root_method_to(target)
      (class << target; self; end).class_eval do
        def root?
          self == '/'
        end
      end
    end
    
  end
end
