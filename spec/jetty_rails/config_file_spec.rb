require File.dirname(__FILE__) + '/../spec_helper'

describe JettyRails::Runner, "with config file" do
  before do
    @yaml_config = YAML.load_file(File.join(File.dirname(__FILE__), '..', 'config.yml'))
  end
  
  it "should handle config.yml with several servers and apps" do
    config = @yaml_config
    runner = JettyRails::Runner.new(config)
    runner.servers.size.should == 3
    runner.servers[4000].should_not == nil
    runner.servers[3000].should_not == nil
    server = runner.servers[8080]
    server.should_not == nil
    server.app_contexts.size.should == 2
  end
  
  it "should setup correct context_paths from config.yml with several servers and apps" do
    config = @yaml_config
    runner = JettyRails::Runner.new(config)
    runner.servers[4000].config[:context_path].should == "/testB"
    runner.servers[3000].config[:context_path].should == "/testA"
    
    runner.servers[8080].config[:context_path].should == "/"
    runner.servers[8080].app_contexts[0].context_path.should == "/testC"
    runner.servers[8080].app_contexts[1].context_path.should == "/testD"
  end  
end