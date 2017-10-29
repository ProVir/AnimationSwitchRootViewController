//
//  AnimationSwitchRootViewController.swift
//  AnimationSwitchRootViewController
//
//  Created by Короткий Виталий (ViR) on 29.10.17.
//  Copyright © 2017 ProVir. All rights reserved.
//

import UIKit

public extension UIWindow {
    
    ///Transition Direction - equal CATransitionSubType.
    @objc public enum TransitionDirection: Int {
        case fromRight
        case fromLeft
        case fromTop
        case fromBottom
        
        var subType:String {
            switch self {
            case .fromRight:  return kCATransitionFromRight
            case .fromLeft:   return kCATransitionFromLeft
            case .fromTop:    return kCATransitionFromTop
            case .fromBottom: return kCATransitionFromBottom
            }
        }
        
        //Bug - kCATransitionFromTop and kCATransitionFromBottom confused in CATransition
        var subTypeForCATransition:String {
            switch self {
            case .fromRight, .fromLeft:  return subType
            case .fromTop:    return kCATransitionFromBottom
            case .fromBottom: return kCATransitionFromTop
            }
        }
    }
    
    
    
    /**
     Core Animation: custom transition and temp background window.
 
     - Parameters:
         - rootViewController: ViewController to switch.
         - transition: Custom core animation transition.
         - backgroundColor: Background color when animation in process. Default is black.
         - backgroundView: View for background when animation in process.
    */
    @objc public func switchRootViewController(to rootViewController:UIViewController,
                                         withTransition transition:CATransition,
                                         backgroundColor:UIColor? = nil,
                                         backgroundView:UIView? = nil) {
        
        setRootViewController(rootViewController,
                              with: transition,
                              backgroundColor: backgroundColor,
                              andBackgroundView: backgroundView)
    }
    
    /**
     Core Animation: push transition and temp background window.
     
     - Parameters:
         - rootViewController: ViewController to switch.
         - direction: Direction animation. Equal CATransitionSubType in CATransition.
         - duration: Duration animation. Default = 0.3.
         - backgroundColor: Background color when animation in process. Default is black.
         - backgroundView: View for background when animation in process.
     */
    @objc public func switchRootViewControllerPushTransition(to rootViewController:UIViewController,
                                                       direction:TransitionDirection,
                                                       duration:CGFloat = 0.3,
                                                       backgroundColor:UIColor? = nil,
                                                       backgroundView:UIView? = nil) {
        
        setRootViewController(rootViewController,
                              pushTransactionRoute: direction.subTypeForCATransition,
                              duration: duration,
                              backgroundColor: backgroundColor,
                              andBackgroundView: backgroundView)
    }
    
    /**
     Core Animation: push transition and temp background window with image as background.
     
     - Parameters:
         - rootViewController: ViewController to switch.
         - direction: Direction animation. Equal CATransitionSubType in CATransition.
         - duration: Duration animation. Default = 0.3.
         - backgroundColor: Background color when animation in process. Default is black.
         - backgroundImage: Image for background when animation in process.
     */
    @objc public func switchRootViewControllerPushTransition(to rootViewController:UIViewController,
                                                       direction:TransitionDirection,
                                                       duration:CGFloat = 0.3,
                                                       backgroundColor:UIColor? = nil,
                                                       backgroundImage:UIImage) {
        
        setRootViewController(rootViewController,
                              pushTransactionRoute: direction.subTypeForCATransition,
                              duration: duration,
                              backgroundColor: backgroundColor,
                              andBackgroundImage: backgroundImage)
    }
    
    
  
    
    /**
     Manually animation: move snaphots views (old and new).
     
     - Parameters:
         - rootViewController: ViewController to switch.
         - direction: Direction animation. Equal CATransitionSubType in CATransition.
         - inAnimation: Animation position for new ViewController.
         - outAnimation: Animation position for old ViewController.
         - duration: Duration animation. Default = 0.3.
         - options: UIViewAnimationOptions for UIView animations.
     */
    @objc public func switchRootViewControllerManuallyMove(to rootViewController:UIViewController,
                                                           direction:TransitionDirection,
                                                           inAnimation:Bool = true,
                                                           outAnimation:Bool = true,
                                                           duration:CGFloat = 0.4,
                                                           options:UIViewAnimationOptions = []) {
        
        setRootViewController(rootViewController,
                              withManuallyInAnimation: inAnimation,
                              outAnimation: outAnimation,
                              routeType: direction.subType,
                              duration: duration,
                              options: options)
    }
    
    
    
}
