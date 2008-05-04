require File.dirname(__FILE__) + '/spec_helper.rb'

describe "binary executable with no command line arguments" do
  
  it "should provide the current execution dir as basedir" do
    runner = mock("runner", :null_object => true)
    current_dir = Dir.pwd
    JettyRails::Runner.should_receive(:new) do |config|
      config.should have_key(:base)
      config[:base].should eql(current_dir)
      runner
    end
    load File.dirname(__FILE__) + '/../bin/jetty_rails'
  end
  
  it "should not set the context path by default" do
    runner = mock("runner", :null_object => true)
    JettyRails::Runner.should_receive(:new) do |config|
      config.should_not have_key(:context_path)
      runner
    end
    load File.dirname(__FILE__) + '/../bin/jetty_rails'
  end
  
  it "should not set the environment by default" do
    runner = mock("runner", :null_object => true)
    JettyRails::Runner.should_receive(:new) do |config|
      config.should_not have_key(:environment)
      runner
    end
    load File.dirname(__FILE__) + '/../bin/jetty_rails'
  end
  
end

describe "binary executable with command line arguments" do
  
  it "should take the first command line argument as basedir" do
    ARGV[0] = '/any/app/dir'
    runner = mock("runner", :null_object => true)
    JettyRails::Runner.should_receive(:new) do |config|
      config.should have_key(:base)
      config[:base].should eql('/any/app/dir')
      runner
    end
    load File.dirname(__FILE__) + '/../bin/jetty_rails'
  end
  
  it "should take the second command line argument as context path" do
    ARGV[0] = '/any/app/dir'
    ARGV[1] = '/myapp'
    runner = mock("runner", :null_object => true)
    JettyRails::Runner.should_receive(:new) do |config|
      config.should have_key(:context_path)
      config[:context_path].should eql('/myapp')
      runner
    end
    load File.dirname(__FILE__) + '/../bin/jetty_rails'
  end
  
  it "should take the third command line argument as custom environment" do
    ARGV[0] = '/any/app/dir'
    ARGV[2] = 'production'
    runner = mock("runner", :null_object => true)
    JettyRails::Runner.should_receive(:new) do |config|
      config.should have_key(:environment)
      config[:environment].should eql('production')
      runner
    end
    load File.dirname(__FILE__) + '/../bin/jetty_rails'
  end
  
end
