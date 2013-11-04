$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "enju_news/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "enju_news"
  s.version     = EnjuNews::VERSION
  s.authors     = ["Kosuke Tanabe"]
  s.email       = ["tanabe@mwr.mediacom.keio.ac.jp"]
  s.homepage    = "https://github.com/next-l/enju_news"
  s.summary     = "enju_news plugin"
  s.description = "News article management for Next-L Enju"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["spec/**/*"] - Dir["spec/dummy/log/*"]

  s.add_dependency "enju_core", "~> 0.2.0.pre1"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "factory_girl_rails"
  s.add_development_dependency "vcr"
  s.add_development_dependency "fakeweb"
  s.add_development_dependency "sunspot-rails-tester"
  #s.add_development_dependency "enju_leaf", "~> 1.2.0.pre1"
end
