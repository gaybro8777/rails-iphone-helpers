ENV['RAILS_ENV'] = 'test'

require_relative 'test_helper'
require_relative 'dummy/config/environment'

require 'rails/test_help' # huh?

Rails.backtrace_cleaner.remove_silencers!

class ActionController::TestCase
  def assert_tag(name, attributes)
    options = {tag: name.to_s, attributes: attributes}

    assert !document.find(options).nil?
  end

  private

  def document
    @document ||= HTML::Document.new(body, false, false)
  end
end
