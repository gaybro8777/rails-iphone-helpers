require 'action_view'

module RailsIphoneHelpers
  def iphone(key, options = {})
    tagname, attributes = send(key, options)

    tag(tagname, attributes)
  end

  protected

  def format_detection(options)
    options[:name] = 'format-detection'
    options[:content] = "telephone=#{(options[:telephone] && 'yes') || 'no'}"
    options[:telephone] = nil
    [:meta, options]
  end

  def fullscreen(options)
    options[:name] = 'apple-mobile-web-app-capable'
    options[:content] = 'yes'
    [:meta, options]
  end

  def icon(options)
    options[:rel] = 'apple-touch-icon'
    options[:rel] += '-precomposed' if options[:precomposed]
    options[:precomposed] = nil if options[:precomposed]
    [:link, options]
  end

  def splash(options)
    options[:rel] = 'apple-touch-startup-image'
    [:link, options]
  end

  def status_bar(options)
    options[:name] = 'apple-mobile-web-app-status-bar-style'
    options[:content] = (%w[black black-translucent].include?(options[:color]) && options[:color]) || 'default'
    options[:color] = nil if options[:color]
    [:meta, options]
  end

  def viewport(options)
    options = options.map do |key, value|
      key = key.to_s.gsub('_', '-').to_sym

      [key, value]
    end
    options = Hash[options]
    defaults = {:'initial-scale' => 1, :'maximum-scale' => 1, :width => 'device-width'}
    content = defaults.merge(options).stringify_keys.sort.collect { |k,v| "#{k}=#{v}" }.join(', ')
    options = {:content => content, :name => 'viewport'}
    [:meta, options]
  end
end

module ::ActionView::Helpers::TagHelper
  include RailsIphoneHelpers
end
