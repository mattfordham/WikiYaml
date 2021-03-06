require 'from_yaml'

class TrainingSlide < FromYaml

  attr_accessor :name, :content

  # Class Methods

  def self.load
    super path_to_yaml: "#{Rails.root}/db/training-content/slides/*.yml", cache_key: "slides"
  end
  
end