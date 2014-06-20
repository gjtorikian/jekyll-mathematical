Gem::Specification.new do |s|
  s.name                  = "jekyll-mathematical"
  s.version               = "0.1.0"
  s.summary               = "A converter for Jekyll to turn math into images."
  s.authors               = "Garen J. Torikian"
  s.homepage              = "https://github.com/gjtorikian/jekyll-mathematical"
  s.license               = "MIT"
  s.files                 = ["lib/jekyll-mathematical.rb"]

  s.add_dependency "jekyll"
  s.add_dependency "mathematical", "~> 0.4"
  s.add_dependency "math-to-itex", "~> 0.3"
  s.add_development_dependency "rspec", "~> 2.13.0"
  s.add_development_dependency "rake"
end
