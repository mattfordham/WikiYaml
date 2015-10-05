require 'from_yaml'

class TrainingLibrary < FromYaml

  attr_accessor :name, :modules
  alias_method :raw_modules, :modules 

  # Class Methods

  def self.load
    super path_to_yaml: "#{Rails.root}/db/training-content/libraries/*.yml", cache_key: "libraries"
  end


  # Instance Methods

  def modules
    TrainingModule.all().find_all do |training_module|
      raw_modules.include? training_module.slug      
    end
  end
  

end