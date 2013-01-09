class IphoneHelpersTest < MiniTest::Unit::TestCase
  include ActionView::Helpers::TagHelper

  def test_apple_mobile_web_app_capable
    assert_equal iphone(:fullscreen), '<meta content="yes" name="apple-mobile-web-app-capable" />'
  end

  def test_apple_mobile_web_app_status_bar_style
    assert_equal iphone(:status_bar), '<meta content="default" name="apple-mobile-web-app-status-bar-style" />'
  end

  def test_apple_mobile_web_app_status_bar_style_black
    assert_equal iphone(:status_bar, :color => 'black'), '<meta content="black" name="apple-mobile-web-app-status-bar-style" />'
  end

  def test_apple_mobile_web_app_status_bar_style_black_translucent
    assert_equal iphone(:status_bar, :color => 'black-translucent'), '<meta content="black-translucent" name="apple-mobile-web-app-status-bar-style" />'
  end

  def test_apple_touch_icon
    assert_equal iphone(:icon, :href => '/assets/iphone.png'), '<link href="/assets/iphone.png" rel="apple-touch-icon" />'
  end

  def test_apple_touch_icon_precomposed
    assert_equal iphone(:icon, :href => '/assets/iphone.png', :precomposed => true), '<link href="/assets/iphone.png" rel="apple-touch-icon-precomposed" />'
  end

  def test_apple_touch_startup_image
    assert_equal iphone(:splash, :href => '/assets/splash.png'), '<link href="/assets/splash.png" rel="apple-touch-startup-image" />'
  end

  def test_format_detection_disable_telephone
    assert_equal iphone(:format_detection, :telephone => false), '<meta content="telephone=no" name="format-detection" />'
  end

  def test_format_detection_enable_telephone
    assert_equal iphone(:format_detection, :telephone => true), '<meta content="telephone=yes" name="format-detection" />'
  end

  def test_viewport
    assert_equal iphone(:viewport), '<meta content="initial-scale=1; maximum-scale=1; width=device-width" name="viewport" />'
  end

  def test_viewport_with_custom_attributes
    assert_equal iphone(:viewport, :width => 320, :height => 480, :initial_scale => 2.5, :minimum_scale => 0.5, :maximum_scale => 3, :user_scalable => 'no'), '<meta content="height=480; initial-scale=2.5; maximum-scale=3; minimum-scale=0.5; user-scalable=no; width=320" name="viewport" />'
  end
end
