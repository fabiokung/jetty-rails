class WarblerReader
  attr_reader :config
  
  def initialize
    # TODO ignore jruby and jruby-rack
    config = load("#{config[:base]}/config/warble.rb")
    config.java_libs.each do |jar|
      require jar
    end
    # TODO require custom classes
  end
  
  
end