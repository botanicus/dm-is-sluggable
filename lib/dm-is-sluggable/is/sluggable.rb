# coding: utf-8

module DataMapper
  module Is
    module Sluggable
      ##
      # fired when your plugin gets included into Resource
      #
      def self.included(base)
      end

      ##
      # Methods that should be included in DataMapper::Model.
      # Normally this should just be your generator, so that the namespace
      # does not get cluttered. ClassMethods and InstanceMethods gets added
      # in the specific resources when you fire is :example
      ##

      def is_sluggable(options = Hash.new)
        # Add class-methods
        extend  DataMapper::Is::Sluggable::ClassMethods
        # Add instance-methods
        include DataMapper::Is::Sluggable::InstanceMethods
      end

      module ClassMethods
      end

      module InstanceMethods
        def set_slug(slug, iteraction = 1)
          raise ArgumentError if slug.nil?
          new_slug = "#{slug}#{"-#{iteraction}" unless iteraction == 1}"
          self.attribute_set(:slug, new_slug)
          if self.class.first(:slug => self.slug)
            self.set_slug(slug, iteraction.to_i + 1)
          end
        end
      end
    end
  end
end
