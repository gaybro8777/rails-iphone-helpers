class IphoneHelpersTest < MiniTest::Unit::TestCase
  include ActionView::Helpers::TagHelper

  def test_apple_mobile_web_app_capable
    assert_tag iphone(:fullscreen), :meta, name: 'apple-mobile-web-app-capable', content: 'yes'
  end

  def test_apple_mobile_web_app_status_bar_style
    assert_tag iphone(:status_bar), :meta, name: 'apple-mobile-web-app-status-bar-style', content: 'default'
  end

  def test_apple_mobile_web_app_status_bar_style_black
    assert_tag iphone(:status_bar, color: 'black'), :meta, name: 'apple-mobile-web-app-status-bar-style', content: 'black'
  end

  def test_apple_mobile_web_app_status_bar_style_black_translucent
    assert_tag iphone(:status_bar, color: 'black-translucent'), :meta, name: 'apple-mobile-web-app-status-bar-style', content: 'black-translucent'
  end

  def test_apple_touch_icon
    assert_tag iphone(:icon, href: '/assets/iphone.png'), :link, rel: 'apple-touch-icon', href: '/assets/iphone.png'
  end

  def test_apple_touch_icon_precomposed
    assert_tag iphone(:icon, href: '/assets/iphone.png', precomposed: true), :link, rel: 'apple-touch-icon-precomposed', href: '/assets/iphone.png'
  end

  def test_apple_touch_startup_image
    assert_tag iphone(:splash, href: '/assets/splash.png'), :link, rel: 'apple-touch-startup-image', href: '/assets/splash.png'
  end

  def test_format_detection_disable_telephone
    assert_tag iphone(:format_detection, telephone: false), :meta, name: 'format-detection', content: 'telephone=no'
  end

  def test_format_detection_enable_telephone
    assert_tag iphone(:format_detection, telephone: true), :meta, name: 'format-detection', content: 'telephone=yes'
  end

  def test_viewport
    assert_tag iphone(:viewport), :meta, name: 'viewport', content: 'initial-scale=1; maximum-scale=1; width=device-width'
  end

  def test_viewport_with_custom_attributes
    assert_tag iphone(:viewport, width: 320, height: 480, initial_scale: 2.5, minimum_scale: 0.5, maximum_scale: 3, user_scalable: 'no'), :meta, name: 'viewport', content: 'height=480; initial-scale=2.5; maximum-scale=3; minimum-scale=0.5; user-scalable=no; width=320'
  end
end
