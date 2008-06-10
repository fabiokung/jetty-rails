class WarblerReader
  attr_reader :config
  
  def initialize
    config = load("#{config[:base]}/config/warble.rb")
    config.java_libs.each do |jar|
      require jar
    end
  end
  
  
end