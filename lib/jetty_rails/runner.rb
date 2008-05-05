require "jruby"

module JettyRails
  
  class Runner
    attr_reader :config
    attr_reader :server
    attr_reader :app_context
    
    @@defaults = {
      :environment => 'development',
      :context_path => '/'
    }
    
    def initialize(config = {})
      @config = config.symbolize_keys!.reverse_merge!(@@defaults)
      add_root_method_to @config[:context_path]
      
      raise 'Basedir to be run must be provided' unless config[:base]
      
      @server = Jetty::Server.new 8080
      
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
      @resources = no_context_path_for_urls_on @resources unless config[:context_path].root?
      server.add_handler(@resources)
    end
    
    def no_context_path_for_urls_on(original_handler)
      rewriter = Jetty::Handler::RewriteHandler.new
      rewriter.add_rewrite_rule("#{config[:context_path]}/*", "/")
      rewriter.handler = original_handler
      rewriter
    end
    
    def install_rack_on(server)
      @app_context = Jetty::Handler::WebAppContext.new("/", config[:context_path])
      @app_context.class_loader = JRuby.runtime.jruby_class_loader
      @app_context.resource_base = config[:base]
      
      # refer to goldspike and jruby-rack documentation
      @app_context.init_params = {
        'rails.root' => '/',
        'public.root' => '/public',
        'rails.env' => config[:environment],
        'gem.path' => 'tmp/war/WEB-INF/gems'
      }
      
      @app_context.add_event_listener(Rack::RailsServletContextListener.new)
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
