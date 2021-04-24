//
//  AnimationSwitchRootViewController.swift
//  AnimationSwitchRootViewController
//
//  Created by Короткий Виталий (ViR) on 29.10.17.
//  Copyright © 2017 ProVir. All rights reserved.
//

import UIKit

#if canImport(AnimationSwitchRootViewControllerObjC)
import AnimationSwitchRootViewControllerObjC
#endif

public extension UIWindow {
    
    ///Transition Direction - equal CATransitionSubType.
    @objc enum TransitionDirection: Int {
        case fromRight
        case fromLeft
        case fromTop
        case fromBottom
        
        var subType: CATransitionSubtype {
            switch self {
            case .fromRight:  return CATransitionSubtype.fromRight
            case .fromLeft:   return CATransitionSubtype.fromLeft
            case .fromTop:    return CATransitionSubtype.fromTop
            case .fromBottom: return CATransitionSubtype.fromBottom
            }
        }
        
        //Bug - kCATransitionFromTop and kCATransitionFromBottom confused in CATransition
        var subTypeForCATransition: CATransitionSubtype {
            switch self {
            case .fromRight, .fromLeft:  return subType
            case .fromTop:    return CATransitionSubtype.fromBottom
            case .fromBottom: return CATransitionSubtype.fromTop
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
    @objc func switchRootViewController(to rootViewController: UIViewController,
                                         withTransition transition: CATransition,
                                         backgroundColor: UIColor? = nil,
                                         backgroundView: UIView? = nil) {
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
    @objc func switchRootViewControllerPushTransition(to rootViewController: UIViewController,
                                                       direction: TransitionDirection,
                                                       duration: CGFloat = 0.3,
                                                       backgroundColor: UIColor? = nil,
                                                       backgroundView: UIView? = nil) {
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
    @objc func switchRootViewControllerPushTransition(to rootViewController: UIViewController,
                                                       direction: TransitionDirection,
                                                       duration: CGFloat = 0.3,
                                                       backgroundColor: UIColor? = nil,
                                                       backgroundImage: UIImage) {
        setRootViewController(rootViewController,
                              pushTransactionRoute: direction.subTypeForCATransition,
                              duration: duration,
                              backgroundColor: backgroundColor,
                              andBackgroundImage: backgroundImage)
    }
    
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
    @objc func switchRootViewControllerManuallyMove(to rootViewController: UIViewController,
                                                           direction: TransitionDirection,
                                                           inAnimation: Bool = true,
                                                           outAnimation: Bool = true,
                                                           duration: CGFloat = 0.4,
                                                           options: UIView.AnimationOptions = []) {
        setRootViewController(rootViewController,
                              withManuallyInAnimation: inAnimation,
                              outAnimation: outAnimation,
                              routeType: direction.subType,
                              duration: duration,
                              options: options)
    }
}
