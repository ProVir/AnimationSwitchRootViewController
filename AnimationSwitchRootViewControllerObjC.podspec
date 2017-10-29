Pod::Spec.new do |s|

  s.name         = "AnimationSwitchRootViewControllerObjC"
  s.version      = "1.0.0"
  s.summary      = "Core extension for UIWindow - animation switch rootViewController in UIWindow"

  s.description  = <<-DESC
Written in Objective-C, only core.
Support two types animation: CATransition and move shnapshots views.
                   DESC

  s.homepage     = "https://github.com/ProVir/AnimationSwitchRootViewController"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "ViR (Vitaliy Korotkiy)" => "admin@provir.ru" }

  s.platform     = :ios, "6.0"


  s.source       = { :git => "https://github.com/ProVir/AnimationSwitchRootViewController.git", :tag => "#{s.version}" }


  s.source_files = [
    'AnimationSwitchRootViewControllerObjC/*.h',
    'AnimationSwitchRootViewController/UIWindow+PVAnimationSwitchRootViewController.{h,m}',
    'AnimationSwitchRootViewController/UIApplication+PVRootWindow.{h,m}'
  ]

  s.public_header_files = [
    'AnimationSwitchRootViewControllerObjC/*.h',
    'AnimationSwitchRootViewController/UIWindow+PVAnimationSwitchRootViewController.h',
    'AnimationSwitchRootViewController/UIApplication+PVRootWindow.h'
  ]

end
