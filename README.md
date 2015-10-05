There are three main models: `TrainingLibrary`, `TrainingModule`, and `TrainingSlide`. Each is inherits basic functionality from the `FromYaml` base class. 

Each has a `load()` method that loads the corresponding Yaml content from *db/training-content* and caches it using `Rails.cache.write`. The `load()` class methods are called from an initializer (*config/initializers/training_content.rb*).

Check out `app/views/pages/index.html.erb` to see how the data is all knit together. 