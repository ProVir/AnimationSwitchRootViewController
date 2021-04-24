Pod::Spec.new do |s|

  s.name         = "AnimationSwitchRootViewController"
  s.version      = "1.0.3"
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
  s.swift_versions = ['5.0', '5.1', '5.2', '5.3']
  s.default_subspec = 'Swift'


  s.subspec 'Swift' do |ss|
    ss.platform     = :ios, "8.0"

    ss.source_files        = [
      'AnimationSwitchRootViewController/ObjC/*.{h,m}',
      'AnimationSwitchRootViewController/Swift/*.swift'
    ]
    ss.public_header_files = 'AnimationSwitchRootViewController/ObjC/*.h'
  end


  s.subspec 'ObjC' do |ss|
    ss.platform     = :ios, "6.0"

    ss.source_files = [
      'AnimationSwitchRootViewControllerObjC/*.h',
      'AnimationSwitchRootViewController/ObjC/*.{h,m}'
    ]

    ss.public_header_files = [
      'AnimationSwitchRootViewControllerObjC/*.h',
      'AnimationSwitchRootViewController/ObjC/*.h'
    ]
  end

end
