begin
  require "rubygems/specification"
rescue SecurityError
  # http://gems.github.com
end

VERSION  = "0.9.10"
SPECIFICATION = ::Gem::Specification.new do |s|
  s.name = "dm-is-sluggable"
  # s.version = Rango::VERSION
  s.version = VERSION
  s.authors = ["Jakub Šťastný aka Botanicus"]
  s.homepage = "http://github.com/botanicus/dm-is-sluggable"
  s.summary = "This is plugin for easy creating unique slugs from other properties."
  # s.description = "" # TODO: long description
  s.cert_chain = nil
  s.email = ["knava.bestvinensis", "gmail.com"].join("@")
  s.files = Dir.glob("**/*") - Dir.glob("pkg/*")
  s.add_dependency "dm-core"
  s.require_paths = ["lib"]
  # s.required_ruby_version = ::Gem::Requirement.new(">= 1.9.1")
  # s.rubyforge_project = "rango"
end
