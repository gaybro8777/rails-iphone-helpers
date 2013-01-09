require 'action_view'

module IphoneHelpers
  STATUS_BAR_COLORS = %w[black black-translucent]

  def iphone(key, options = {})
    tagname, attributes = send(key, options)

    tag(tagname, attributes)
  end

  protected

  def format_detection(options)
    options[:name] = 'format-detection'
    options[:content] = 'telephone='
    options[:content] += options.delete(:telephone) ? 'yes' : 'no'

    [:meta, options]
  end

  def fullscreen(options)
    options[:name] = 'apple-mobile-web-app-capable'
    options[:content] = 'yes'

    [:meta, options]
  end

  def icon(options)
    options[:rel] = 'apple-touch-icon'
    options[:rel] += '-precomposed' if options.delete(:precomposed)

    [:link, options]
  end

  def splash(options)
    options[:rel] = 'apple-touch-startup-image'

    [:link, options]
  end

  def status_bar(options)
    color = options.delete(:color)
    options[:name] = 'apple-mobile-web-app-status-bar-style'
    options[:content] = STATUS_BAR_COLORS.include?(color) ? color : 'default'

    [:meta, options]
  end

  def viewport(options)
    default_options = {
      'initial-scale' => 1,'maximum-scale' => 1, 'width' => 'device-width'
    }
    options = options.map do |key, value|
      key = key.to_s.gsub('_', '-')

      [key, value]
    end
    options = Hash[options]
    content = default_options.merge(options).sort.collect { |k, v| "#{k}=#{v}" }.join(', ')
    options = {content: content, name: 'viewport'}

    [:meta, options]
  end
end

module ::ActionView::Helpers::TagHelper
  include IphoneHelpers
end
