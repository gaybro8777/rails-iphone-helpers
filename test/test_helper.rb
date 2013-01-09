require 'rubygems'
require 'bundler/setup'

Bundler.require(:test)

require 'test/unit'
require 'active_support'
require 'action_view'
require File.join(File.dirname(__FILE__), '../lib/iphone_helpers')
