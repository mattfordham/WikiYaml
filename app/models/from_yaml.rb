class FromYaml

  class << self
    attr_accessor :cache_key
  end
  
  attr_accessor :slug

  # Class Methods

  def self.load(args)
    collection = []

    self.cache_key = args[:cache_key]

    Dir.glob(args[:path_to_yaml]) do |yaml_file|
      slug = File.basename(yaml_file, ".yml")
      content = YAML.load_file(yaml_file).to_hashugar
      collection << self.new(content, slug)
    end
    Rails.cache.write args[:cache_key], collection
  end

  def self.all
    Rails.cache.read(self.cache_key)
  end

  def self.find(slug)
    self.all().find do |item|
      slug == item.slug
    end
  end

  # Instance Methods

  def initialize(content, slug)
    self.slug = slug
    content.each do |k, v|
      self.instance_variable_set("@#{k}",v)
    end
  end
  
end