require 'from_yaml'

class TrainingModule < FromYaml

  attr_accessor :name, :slides
  alias_method :raw_slides, :slides 

  # Class Methods

  def self.load
    super path_to_yaml: "#{Rails.root}/db/training-content/modules/*.yml", cache_key: "modules"
  end


  # Instance Methods

  def slides
    TrainingSlide.all().find_all do |slide|
      raw_slides.include? slide.slug      
    end
  end
  
end