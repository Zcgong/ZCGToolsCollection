Pod::Spec.new do |s|
  s.name         = "HYBImageCliped"
  s.version      = "1.1.2"
  s.summary      = "开源高效处理圆角的扩展，包括UIImageView、UIView、UIButton、UIImage的扩展API，可根据图片颜色生成图片带任意圆角，可给UIButton根据不同状态处理图片"
  s.description  = <<-DESC
                   支持生成带任意圆角的图片，支持背景色设置以解决图层混合问题；支持UIButton根据不同状态设置图片及背景图片；支持图片裁剪成任意大小及添加任意圆角且不会离屏渲染；支持根据颜色生成图片且可带任意圆角；支持给任意继承于UIView的控件添加圆角，通过mask来实现；更多功能请查看API。
                   DESC

  s.homepage     = "https://github.com/CoderJackyHuang/HYBImageCliped"
  s.screenshots  = "http://www.henishuo.com/wp-content/uploads/2016/04/cliped.gif"
  s.license      = "MIT"
  s.author             = { "huangyibiao" => "" }
  s.social_media_url   = "http://www.henishuo.com"
  s.source       = { :git => "https://github.com/CoderJackyHuang/HYBImageCliped.git", :tag => "#{s.version}" }
  s.source_files  = "Sources", "*.{h,m}"
  s.requires_arc = true
  s.platform     = :ios, "6.0"
end
