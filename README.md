# AnimationSwitchRootViewController

[![CocoaPods Compatible](https://cocoapod-badges.herokuapp.com/v/AnimationSwitchRootViewController/badge.png)](http://cocoapods.org/pods/AnimationSwitchRootViewController)
[![Carthage Compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/ProVir/AnimationSwitchRootViewController)
[![Platform](https://cocoapod-badges.herokuapp.com/p/AnimationSwitchRootViewController/badge.png)](http://cocoapods.org/pods/AnimationSwitchRootViewController)
[![License](https://cocoapod-badges.herokuapp.com/l/AnimationSwitchRootViewController/badge.png)](https://github.com/ProVir/AnimationSwitchRootViewController/blob/master/LICENSE)

Extension for UIWindow - animation switch rootViewController in UIWindow. Support Objective-C, Swift 3 and 4.
If you need pure Objective-C, use AnimationSwitchRootViewControllerObjC.

![Example demo gif](https://github.com/ProVir/AnimationSwitchRootViewController/blob/master/demo.gif)


- [Features](#features)
- [Requirements](#requirements)
- [Communication](#communication)
- [Installation](#installation)
- [Usage](#usage)
- [Author](#author)
- [License](#license)


## Features

- [x] Change rootViewController in UIWindow with animation.
- [x] Get main UIWindow from UIApplication static function sharedWindow().
- [x] Support CATransaction with backgrounds color, UIVIew or UIImage.
- [x] Support animation move snapshots (manually).



## Requirements

- iOS 8.0+
- Xcode 8.1, 8.2, 8.3, and 9.0
- Swift 3.0, 3.1, 3.2, and 4.0


## Communication

- If you **need help**, go to [provir.ru](http://provir.ru)
- If you **found a bug**, open an issue.
- If you **have a feature request**, open an issue.
- If you **want to contribute**, submit a pull request.



## Installation

### CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Cocoa projects. You can install it with the following command:

```bash
$ gem install cocoapods
```

> CocoaPods 1.1.0+ is required to build AnimationSwitchRootViewController 1.0.0+.

To integrate WebServiceSwift into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '8.0'
use_frameworks!

target '<Your Target Name>' do
pod 'AnimationSwitchRootViewController', '~> 1.0'
end
```

Then, run the following command:

```bash
$ pod install
```

if you need pure Objective-C, use AnimationSwitchRootViewControllerObjC:
```ruby
pod 'AnimationSwitchRootViewControllerObjC', '~> 1.0'
```

### Carthage

[Carthage](https://github.com/Carthage/Carthage) is a decentralized dependency manager that builds your dependencies and provides you with binary frameworks.

You can install Carthage with [Homebrew](http://brew.sh/) using the following command:

```bash
$ brew update
$ brew install carthage
```

To integrate AnimationSwitchRootViewController into your Xcode project using Carthage, specify it in your `Cartfile`:

```ogdl
github "ProVir/AnimationSwitchRootViewController" ~> 1.0
```

Run `carthage update` to build the framework and drag the built `AnimationSwitchRootViewController.framework` into your Xcode project.

if you need pure Objective-C, use AnimationSwitchRootViewControllerObjC - drag the built `AnimationSwitchRootViewControllerObjC.framework` into your Xcode project.


### Manually

If you prefer not to use any of the aforementioned dependency managers, you can integrate AnimationSwitchRootViewController into your project manually.

Copy files from directory `AnimationSwitchRootViewController` in your project.
if you need pure Objective-C, don't copy `*.swift` files.


---

## Usage

#### Interface in Swift (also Objective-C support):
```swift
public extension UIApplication {
  @objc public static func sharedWindow() -> UIWindow?
}

public extension UIWindow {

  ///Transition Direction - equal CATransitionSubType.
  @objc public enum TransitionDirection : Int {
    case fromRight
    case fromLeft
    case fromTop
    case fromBottom
  }

  /**
  Core Animation: custom transition and temp background window.

  - Parameters:
    - rootViewController: ViewController to switch.
    - transition: Custom core animation transition.
    - backgroundColor: Background color when animation in process. Default is black.
    - backgroundView: View for background when animation in process.
  */
  @objc public func switchRootViewController(to rootViewController: UIViewController,
                                             withTransition transition: CATransition,
                                             backgroundColor: UIColor? = nil,
                                             backgroundView: UIView? = nil)


  /**
  Core Animation: push transition and temp background window.

  - Parameters:
    - rootViewController: ViewController to switch.
    - direction: Direction animation. Equal CATransitionSubType in CATransition.
    - duration: Duration animation. Default = 0.3.
    - backgroundColor: Background color when animation in process. Default is black.
    - backgroundView: View for background when animation in process.
  */
  @objc public func switchRootViewControllerPushTransition(to rootViewController: UIViewController,
                                                           direction: TransitionDirection,
                                                           duration: CGFloat = 0.3,
                                                           backgroundColor: UIColor? = nil,
                                                           backgroundView: UIView? = nil)

  /**
  Core Animation: push transition and temp background window with image as background.

  - Parameters:
    - rootViewController: ViewController to switch.
    - direction: Direction animation. Equal CATransitionSubType in CATransition.
    - duration: Duration animation. Default = 0.3.
    - backgroundColor: Background color when animation in process. Default is black.
    - backgroundImage: Image for background when animation in process.
  */
  @objc public func switchRootViewControllerPushTransition(to rootViewController: UIViewController,
                                                           direction: TransitionDirection,
                                                           duration: CGFloat = 0.3,
                                                           backgroundColor: UIColor? = nil,
                                                           backgroundImage: UIImage)

  /**
    Manually animation: move snapshots views (old and new).

  - Parameters:
    - rootViewController: ViewController to switch.
    - direction: Direction animation. Equal CATransitionSubType in CATransition.
    - inAnimation: Animation position for new ViewController.
    - outAnimation: Animation position for old ViewController.
    - duration: Duration animation. Default = 0.4.
    - options: UIViewAnimationOptions for UIView animations.
  */
  @objc public func switchRootViewControllerManuallyMove(to rootViewController: UIViewController,
                                                         direction: TransitionDirection,
                                                         inAnimation: Bool = true,
                                                         outAnimation: Bool = true,
                                                         duration: CGFloat = 0.4,
                                                         options: UIViewAnimationOptions = [])
                                                         
}
```

#### Interface in Objective-C only (also only support in `AnimationSwitchRootViewControllerObjC`):
```objc

@interface UIApplication (PVRootWindow)
  + (nullable UIWindow*) sharedWindow;
@end


@interface UIWindow (PVAnimationSwitchRootViewController)

  //Core Animation: transition and temp background window
  - (void) setRootViewController:(UIViewController *)rootViewController
                  withTransition:(CATransition*)transition
                 backgroundColor:(nullable UIColor*)color
               andBackgroundView:(nullable UIView*)view;


  //Manually animation: move snapshots
  - (void) setRootViewController:(UIViewController *)rootViewController
         withManuallyInAnimation:(BOOL)inAnimation
                    outAnimation:(BOOL)outAnimation
                       routeType:(NSString*)transitionSubType
                        duration:(CGFloat)duration
                         options:(UIViewAnimationOptions)options;


  //Simplify function
  - (void) setRootViewController:(UIViewController *)rootViewController
            pushTransactionRoute:(NSString*)transitionSubType
                        duration:(CGFloat)duration
                 backgroundColor:(nullable UIColor*)color
               andBackgroundView:(nullable UIView*)view;

  - (void) setRootViewController:(UIViewController *)rootViewController
            pushTransactionRoute:(NSString*)transitionSubType
                        duration:(CGFloat)duration
                 backgroundColor:(nullable UIColor*)color
              andBackgroundImage:(nullable UIImage*)image;



  - (void) setRootViewController:(UIViewController *)rootViewController
               pushManuallyRoute:(NSString*)transitionSubType
                        duration:(CGFloat)duration;

@end

```


#### Example use in swift:
```swift

UIApplication.sharedWindow()?.switchRootViewControllerPushTransition(to: newViewController,
                                                                     direction: .fromRight,
                                                                     backgroundColor: UIColor.white)

UIApplication.sharedWindow()?.switchRootViewControllerManuallyMove(to: newViewController,
                                                                   direction: .fromLeft)

```

More examples you can find in the project in this repository.



## Author

[**ViR (Короткий Виталий)**](http://provir.ru)


## License

AnimationSwitchRootViewController is released under the MIT license. [See LICENSE](https://github.com/ProVir/AnimationSwitchRootViewController/blob/master/LICENSE) for details.


