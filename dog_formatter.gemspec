$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "dog_formatter/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "dog_formatter"
  s.version     = DogFormatter::VERSION
  s.authors     = ["nakamura shinichirou"]
  s.email       = ["naka5313@gmail.com"]
  s.homepage    = ""
  s.summary     = "日付けのFormatter"
  s.description = "日付けの表示形式を変更するgem"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.6"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "ridgepole"
end
