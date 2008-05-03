$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

require "java"
require "jetty_rails/jars"
require "jetty_rails/runner"

module JettyRails
  JETTY_RAILS_HOME = File.dirname(__FILE__) + "/.." unless defined?(JETTY_RAILS_HOME)
end
