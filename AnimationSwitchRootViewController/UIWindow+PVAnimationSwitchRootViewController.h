//
//  UIWindow+PVAnimationSwitchRootViewController.h
//  AnimationSwitchRootViewController
//
//  Created by Виталий Короткий (ViR) on 26.02.16.
//  Copyright © 2016 ProVir. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@interface UIWindow (PVAnimationSwitchRootViewController)

//Core Animation: transiction and temp background window
- (void) setRootViewController:(UIViewController *)rootViewController withTransition:(CATransition*)transition backgroundColor:(nullable UIColor*)color andBackgroundView:(nullable UIView*)view;

//Manually animation: move snaphots
- (void) setRootViewController:(UIViewController *)rootViewController withManuallyInAnimation:(BOOL)inAnimation outAnimation:(BOOL)outAnimation routeType:(NSString*)transitionSubType duration:(CGFloat)duration options:(UIViewAnimationOptions)options;


//Simplify function
- (void) setRootViewController:(UIViewController *)rootViewController pushTransactionRoute:(NSString*)transitionSubType duration:(CGFloat)duration backgroundColor:(nullable UIColor*)color andBackgroundView:(nullable UIView*)view;

- (void) setRootViewController:(UIViewController *)rootViewController pushTransactionRoute:(NSString*)transitionSubType duration:(CGFloat)duration backgroundColor:(nullable UIColor*)color andBackgroundImage:(nullable UIImage*)image;


- (void) setRootViewController:(UIViewController *)rootViewController pushManuallyRoute:(NSString*)transitionSubType duration:(CGFloat)duration;

@end
NS_ASSUME_NONNULL_END
