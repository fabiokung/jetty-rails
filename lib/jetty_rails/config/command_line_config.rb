require 'getoptlong'
require 'jetty_rails/config/rdoc_fix'


class CommandLineConfig

  def self.default_config()
    @config ||= {
      :rails => { 
        :daemonize => false,
        :base => Dir.pwd,
        :port => 3000,
        :config_file => "#{File.join(Dir.pwd, 'config', 'jetty_rails.yml')}",
        :adapter => :rails
      },
      :merb => {
        :daemonize => false,
        :base => Dir.pwd,
        :port => 4000,
        :config_file => "#{File.join(Dir.pwd, 'jetty_merb.yml')}",
        :adapter => :merb
      }
    }
  end

  def self.get_config(default_adapter = :rails)
    config = default_config[default_adapter]
    
    opts = GetoptLong.new(
      [ '--help', '-h', GetoptLong::NO_ARGUMENT ],
      [ '--context-path', '-u', GetoptLong::REQUIRED_ARGUMENT ],
      [ '--port', '-p', GetoptLong::REQUIRED_ARGUMENT ],
      [ '--environment', '-e', GetoptLong::REQUIRED_ARGUMENT ],
      [ '--config', '-c', GetoptLong::OPTIONAL_ARGUMENT ]
    )
    
    opts.each do |opt, arg|
      case opt
        when '--help'
          RDoc::usage
        when '--context-path'
          config[:context_path] = arg
        when '--port'
          config[:port] = arg.to_i
        when '--environment'
          config[:environment] = arg
    	  when '--config'
    	    config[:config_file] = arg if !arg.nil? && arg != ""
    	    config.merge!(YAML.load_file(config[:config_file]))
      end
    end

    config[:base] = ARGV.shift unless ARGV.empty?
    config
  end  
  
end


