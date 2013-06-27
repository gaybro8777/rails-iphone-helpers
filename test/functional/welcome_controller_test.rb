require 'dummy_helper'

class WelcomeControllerTest < ActionController::TestCase
  def test_apple_mobile_web_app_capable
    assert_tag :meta, name: 'apple-mobile-web-app-capable', content: 'yes'
  end

  def test_apple_mobile_web_app_status_bar_style
    assert_tag :meta, name: 'apple-mobile-web-app-status-bar-style', content: 'default'
  end

  def test_apple_mobile_web_app_status_bar_style_black
    assert_tag :meta, name: 'apple-mobile-web-app-status-bar-style', content: 'black'
  end

  def test_apple_mobile_web_app_status_bar_style_black_translucent
    assert_tag :meta, name: 'apple-mobile-web-app-status-bar-style', content: 'black-translucent'
  end

  def test_apple_touch_icon
    assert_tag :link, rel: 'apple-touch-icon', href: '/assets/iphone.png'
  end

  def test_apple_touch_icon_precomposed
    assert_tag :link, rel: 'apple-touch-icon-precomposed', href: '/assets/iphone.png'
  end

  def test_apple_touch_startup_image
    assert_tag :link, rel: 'apple-touch-startup-image', href: '/assets/splash.png'
  end

  def test_format_detection_disable_telephone
    assert_tag :meta, name: 'format-detection', content: 'telephone=no'
  end

  def test_format_detection_enable_telephone
    assert_tag :meta, name: 'format-detection', content: 'telephone=yes'
  end

  def test_viewport
    assert_tag :meta, name: 'viewport', content: 'initial-scale=1, maximum-scale=1, width=device-width'
  end

  def test_viewport_with_custom_attributes
    assert_tag :meta, name: 'viewport', content: 'height=480, initial-scale=2.5, maximum-scale=3, minimum-scale=0.5, user-scalable=no, width=320'
  end

  protected

  def body
    @body ||= begin
      get :index
      @response.body
    end
  end
end
