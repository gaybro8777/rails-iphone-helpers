require 'rubygems'
require 'bundler/setup'

Bundler.require(:test)

require 'minitest/autorun'
require 'action_view'
require File.join(File.dirname(__FILE__), '../lib/iphone_helpers')
