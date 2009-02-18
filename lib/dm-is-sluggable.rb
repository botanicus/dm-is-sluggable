# Needed to import datamapper and other gems
require 'rubygems'
require 'pathname'

# Add all external dependencies for the plugin here
gem 'dm-core'
require 'dm-core'

# Require plugin-files
require Pathname(__FILE__).dirname.expand_path / 'dm-is-sluggable' / 'is' / 'sluggable.rb'
require Pathname(__FILE__).dirname.expand_path / 'dm-is-sluggable' / 'string'


# Include the plugin in Resource
module DataMapper
  module Model
    include DataMapper::Is::Sluggable
  end
end
