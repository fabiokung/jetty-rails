require File.dirname(__FILE__) + '/../spec_helper'

describe JettyRails::Runner, "with no extra configuration" do
  it "should start jetty serving public directory" do
    runner = JettyRails::Runner.new :base => '/Users/fck/RubyDev/blog'
    runner.start
  end
end
