require File.dirname(__FILE__) + '/../spec_helper'

describe JettyRails::Runner, "with no extra configuration" do
  it "should start jetty serving public directory" do
    JettyRails::Runner.new.start
  end
end
