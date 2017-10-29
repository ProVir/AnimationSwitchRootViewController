Pod::Spec.new do |s|

  s.name         = "AnimationSwitchRootViewController"
  s.version      = "1.0.0"
  s.summary      = "Extension for UIWindow - animation switch rootViewController in UIWindow"

  s.description  = <<-DESC
Core written in Objective-C, interface written in Swift.
Support two types animation: CATransition and move shnapshots views.
                   DESC

  s.homepage     = "https://github.com/ProVir/AnimationSwitchRootViewController"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "ViR (Vitaliy Korotkiy)" => "admin@provir.ru" }

  s.platform     = :ios, "8.0"


  s.source       = { :git => "https://github.com/ProVir/AnimationSwitchRootViewController.git", :tag => "#{s.version}" }


  s.source_files = [
    'AnimationSwitchRootViewController/*.{h,m,swift}'
  ]


  s.public_header_files = 'AnimationSwitchRootViewController/*.h'

end
