Pod::Spec.new do |s|

  s.name         = "AnimationSwitchRootViewController"
  s.version      = "1.0.2"
  s.summary      = "Extension for UIWindow - animation switch rootViewController in UIWindow"

  s.description  = <<-DESC
Core written in Objective-C, interface written in Swift.
Support two types animation: CATransition and move shnapshots views.
                   DESC

  s.homepage     = "https://github.com/ProVir/AnimationSwitchRootViewController"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "ViR (Vitaliy Korotkiy)" => "admin@provir.ru" }
  s.source       = { :git => "https://github.com/ProVir/AnimationSwitchRootViewController.git", :tag => "#{s.version}" }

  s.platform     = :ios, "8.0"
  s.swift_version = '5.0'
  s.default_subspec = 'Swift'


  s.subspec 'Swift' do |ss|
    ss.platform     = :ios, "8.0"

    ss.source_files        = 'AnimationSwitchRootViewController/*.{h,m,swift}'
    ss.public_header_files = 'AnimationSwitchRootViewController/*.h'
  end


  s.subspec 'ObjC' do |ss|
    ss.platform     = :ios, "6.0"

    ss.source_files = [
      'AnimationSwitchRootViewControllerObjC/*.h',
      'AnimationSwitchRootViewController/UIWindow+PVAnimationSwitchRootViewController.{h,m}',
      'AnimationSwitchRootViewController/UIApplication+PVRootWindow.{h,m}'
    ]

    ss.public_header_files = [
      'AnimationSwitchRootViewControllerObjC/*.h',
      'AnimationSwitchRootViewController/UIWindow+PVAnimationSwitchRootViewController.h',
      'AnimationSwitchRootViewController/UIApplication+PVRootWindow.h'
    ]
  end

end
