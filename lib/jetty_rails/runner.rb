require "jruby"

module JettyRails
  
  class Runner
    attr_reader :servers
    
    def initialize(config = {})
      @servers = {}
      config.symbolize_keys!
      if config[:servers].nil?
        add_server(config) 
      else
        config[:servers].each do |server_config|
          server_config.symbolize_keys!
          server_config.reverse_merge!(config)
          server_config.delete(:servers)
          add_server(server_config)
        end
      end
    end
    
    def add_server(config = {})
      server = JettyRails::Server.new(config)
      @servers[server.config[:port]] = server
    end
    
    def start
      @servers.each do |base, server|
        log("starting #{base}")
        server.start
      end
    end
    
    
    private
    
    def log(msg)
      $stdout.puts(msg)
    end
    
  end
end
