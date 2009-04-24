require 'fileutils'
include FileUtils

require 'rubygems'
gem 'hoe', '<= 1.8.2'
%w[rake hoe rubigen].each do |req_gem|
  begin
    require req_gem
  rescue LoadError
    puts "This Rakefile requires the '#{req_gem}' RubyGem."
    puts "Installation: gem install #{req_gem} -y"
    exit
  end
end

$:.unshift(File.join(File.dirname(__FILE__), %w[.. lib]))
