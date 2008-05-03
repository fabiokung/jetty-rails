require File.dirname(__FILE__) + '/../spec_helper'

describe JettyRails::Runner, "with no extra configuration" do
  it "should require basedir to be run" do
    lambda { JettyRails::Runner.new }.should raise_error 
  end
  
  it "should receive basedir configuration" do
    runner = JettyRails::Runner.new :base => '/any/app/dir'
    runner.config.should have_key(:base)
    runner.config[:base].should eql('/any/app/dir')
  end
end
