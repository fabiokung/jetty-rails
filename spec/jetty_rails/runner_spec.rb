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
  
  it "should default to development environment" do
    runner = JettyRails::Runner.new :base => Dir.pwd
    runner.config.should have_key(:environment)
    runner.config[:environment].should eql('development')
    runner.app_context.init_params['rails.env'].should eql('development')
  end
  
  it "should default to the root context path"
end

describe JettyRails::Runner, "with custom configuration" do
  
  it "should allow to override the environment" do
    runner = JettyRails::Runner.new :base => Dir.pwd, :environment => 'production'
    runner.config.should have_key(:environment)
    runner.config[:environment].should eql('production')
    runner.app_context.init_params['rails.env'].should eql('production')
  end
  
  it "should allow to overrid the context path"
  
end
