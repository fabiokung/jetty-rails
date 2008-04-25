module JettyRails
  
  class Runner
    attr_accessor :config
    
    def initialize(config = {})
      self.config = config
    end
    
    def start
      s = Jetty::Server.new 8080
      s.start
      s.join
    end
  end
end
