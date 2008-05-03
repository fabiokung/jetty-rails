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
  
end
