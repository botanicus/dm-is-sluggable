# coding=utf-8

require File.join(File.dirname(__FILE__), '..', "spec_helper")
require "dm-is-sluggable"

class Post
  include DataMapper::Resource
  is :sluggable
  property :title, String
  property :slug,  String, :key => true
  before :create do
    set_slug(self.title.to_slug)
  end
end

describe DataMapper::Is::Sluggable do
  before do
    @post = Post.create(:title => "Hello Bloody World")
  end

  describe "#set_slug" do
    it "should create slug" do
      @post.slug.should eql("hello-bloody-world")
    end

    it "should create unique slug" do
      second = Post.create(:title => "Hello Bloody World")
      second.slug.should eql("hello-bloody-world-2")
    end
  end
end
