$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

require "java"
require "rubygems"
require "activesupport"
require "jetty_rails/jars"
require "jetty_rails/adapters/rails_adapter"
require "jetty_rails/adapters/merb_adapter"
require "jetty_rails/runner"
require "jetty_rails/handler/delegate_on_errors_handler"

module JettyRails
  JETTY_RAILS_HOME = File.dirname(__FILE__) + "/.." unless defined?(JETTY_RAILS_HOME)
end
