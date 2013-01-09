require 'rubygems'
require 'bundler/setup'

require 'awesome_print'
require 'minitest/autorun'
require File.expand_path('../../lib/iphone_helpers', __FILE__)

module MiniTest::Assertions
  def assert_tag(tag, name, attributes = {})
    document = HTML::Document.new(tag, false, false)
    options = {tag: name.to_s, attributes: attributes}

    assert !document.find(options).nil?
  end
end
