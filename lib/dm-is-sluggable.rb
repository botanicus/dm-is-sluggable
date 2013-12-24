# encoding: utf-8

require "dm-core"

require_relative "dm-is-sluggable/is/sluggable"
require_relative "dm-is-sluggable/string"

# Include the plugin in Resource
module DataMapper
  module Model
    include DataMapper::Is::Sluggable
  end
end
