class Configuration 
  
  @@settings = YAML::load_file('config/config.yml')[Rails.env]
  
  class MissingConfigOptionError < StandardError; 
  end 
  
  def self.method_missing(key) 
    raise MissingConfigOptionError, "#{key.to_s} is not in the config file" unless @@settings.include?(key.to_s) 
    @@settings[key.to_s] 
  end 
end