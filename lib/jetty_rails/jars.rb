module JettyRails
  
  require "servlet-api-2.5-6.1.14"
  require "jetty-6.1.14"
  require "jetty-util-6.1.14"
  require "jetty-plus-6.1.14"
  require "core-3.1.1"
  require "jsp-api-2.1"
  require "jsp-2.1"
  module Jetty
    include_package "org.mortbay.jetty"
    include_package "org.mortbay.jetty.servlet"
    include_package "org.mortbay.jetty.nio"
    module Handler
      include_package "org.mortbay.jetty.handler"
      include_package "org.mortbay.jetty.webapp"
    end
    module Thread
      include_package "org.mortbay.thread"
    end
  end

  require "jruby-rack-0.9.2"
  module Rack
    include_package "org.jruby.rack"
    include_package "org.jruby.rack.rails"
    include_package "org.jruby.rack.merb"
  end
  
end
