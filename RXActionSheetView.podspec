
Pod::Spec.new do |s|
  s.name     = "RXActionSheetView"
  s.version  = "1.0"
  s.license  = "MIT"
  s.summary  = "RXActionSheetView is a base as view"
  s.homepage = "https://github.com/xzjxylophone/RXActionSheetView"
  s.author   = { 'Rush.D.Xzj' => 'xzjxylophoe@gmail.com' }
  s.social_media_url = "http://weibo.com/xzjxylophone"
  s.source   = { :git => 'https://github.com/xzjxylophone/RXActionSheetView.git', :tag => "v#{s.version}" }
  s.description = %{
        RXActionSheetView is a base as view.
  }
  s.source_files = 'RXActionSheetView/*.{h,m}'
  s.frameworks = 'Foundation', 'UIKit'
  s.requires_arc = true
  s.platform = :ios, '5.0'

end



