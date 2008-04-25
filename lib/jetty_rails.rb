$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

require "java"
require "jruby-rack-1.0-SNAPSHOT"
require "jetty_rails/jars"
require "jetty_rails/runner"

module JettyRails
  
end