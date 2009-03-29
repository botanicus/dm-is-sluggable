# coding=utf-8

require File.join(File.dirname(__FILE__), '..', "spec_helper")

describe "String#to_ascii" do
  it "should remove diacritics" do
    "Žádná česká znaménka".to_ascii.should eql("Zadna ceska znamenka")
  end
end

describe "String#to_slug" do
  it "should remove diacritics" do
    "česká".to_slug.should eql("ceska")
  end
  
  it "should downcase slug" do
    "BIG".to_slug.should eql("big")
  end
  
  it "should remove nonwords chars" do
    "%^@$".to_slug.should eql("")
  end
  
  it "should works" do
    " Samolepka   X2 (černá). ".to_slug.should eql("samolepka-x2-cerna")
  end
end
