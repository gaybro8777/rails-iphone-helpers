require 'rubygems'
require 'bundler/setup'

require 'awesome_print'
require 'minitest/autorun'
require File.join(File.dirname(__FILE__), '../lib/iphone_helpers')

module MiniTest::Assertions
  def assert_tag(tag, name, attributes = {})
    document = HTML::Document.new(tag, false, false)
    options = {tag: name.to_s, attributes: attributes}

    assert !document.find(options).nil?
  end
end
