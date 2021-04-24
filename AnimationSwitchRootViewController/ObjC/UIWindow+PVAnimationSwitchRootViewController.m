//
//  UIWindow+PVAnimationSwitchRootViewController.m
//  AnimationSwitchRootViewController
//
//  Created by Виталий Короткий (ViR) on 26.02.16.
//  Copyright © 2016 ProVir. All rights reserved.
//

#import "UIWindow+PVAnimationSwitchRootViewController.h"



@implementation UIWindow (PVAnimationSwitchRootViewController)

#pragma mark Base functions
- (void) setRootViewController:(UIViewController *)rootViewController withTransition:(CATransition*)transition backgroundColor:(UIColor*)color andBackgroundView:(UIView*)view {

    UIWindow* window;
    
    if (color != nil || view != nil) {
        window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
        
        if(color != nil)
            window.backgroundColor = color;
        
        if(view != nil)
        {
            view.frame = self.window.bounds;
            
            window.rootViewController = [UIViewController new];
            window.rootViewController.view = view;
        }
        
        [window makeKeyAndVisible];
    }
    
    [self.layer addAnimation:transition forKey:kCATransition];
    self.rootViewController = rootViewController;
    [self makeKeyAndVisible];
    
    if(window != nil) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(transition.duration + 1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            window.hidden = true;  //Нужно только для захвата временного окна в памяти
        });
    }
}


- (void) setRootViewController:(UIViewController *)rootViewController withManuallyInAnimation:(BOOL)inAnimation outAnimation:(BOOL)outAnimation routeType:(CATransitionSubtype)transitionSubType duration:(CGFloat)duration options:(UIViewAnimationOptions)options {
    
    if(!inAnimation && !outAnimation) {
        CATransition* transition = [CATransition animation];
        transition.duration = duration;
        [self setRootViewController:rootViewController withTransition:transition backgroundColor:nil andBackgroundView:nil];
        return;
    }
    
    
    UIView *inView = [rootViewController.view snapshotViewAfterScreenUpdates:YES];
    UIView *outView = nil;
    
    if(outAnimation)
        outView = [self.rootViewController.view snapshotViewAfterScreenUpdates:YES];
    
    CGSize inSizeForOut = inView.bounds.size;
    CGRect outRect = CGRectNull;
    
    if([transitionSubType isEqualToString:kCATransitionFromBottom]) {
        if(inAnimation)
            inView.frame = CGRectMake(0, inView.frame.size.height, inView.frame.size.width, inView.frame.size.height);
        
        if(outView != nil)
            outRect = CGRectMake(0, -inSizeForOut.height, outView.frame.size.width, outView.frame.size.height);
    }
    else if([transitionSubType isEqualToString:kCATransitionFromTop]) {
        if(inAnimation)
            inView.frame = CGRectMake(0, -inView.frame.size.height, inView.frame.size.width, inView.frame.size.height);
        
        if(outView != nil)
            outRect = CGRectMake(0, inSizeForOut.height, outView.frame.size.width, outView.frame.size.height);
    }
    else if([transitionSubType isEqualToString:kCATransitionFromLeft]) {
        if(inAnimation)
            inView.frame = CGRectMake(-inView.frame.size.width, 0, inView.frame.size.width, inView.frame.size.height);
        
        if(outView != nil)
            outRect = CGRectMake(inSizeForOut.width, 0, outView.frame.size.width, outView.frame.size.height);
    }
    else if([transitionSubType isEqualToString:kCATransitionFromRight]) {
        if(inAnimation)
            inView.frame = CGRectMake(inView.frame.size.width, 0, inView.frame.size.width, inView.frame.size.height);
        
        if(outView != nil)
            outRect = CGRectMake(-inSizeForOut.width, 0, outView.frame.size.width, outView.frame.size.height);
    }
    else {
        CATransition* transition = [CATransition animation];
        transition.duration = duration;
        [self setRootViewController:rootViewController withTransition:transition backgroundColor:nil andBackgroundView:nil];
        return;
    }
    
    
    [self.rootViewController.view addSubview:inView];
    if(outView != nil) [self.rootViewController.view addSubview:outView];
    
    
    [UIView transitionWithView:self
                      duration:duration
                       options:options
                    animations:^{
                        if(inAnimation) inView.frame = CGRectMake(0, 0, inView.frame.size.width, inView.frame.size.height);
                        if(outView != nil) outView.frame = outRect;
                    } completion:^(BOOL finished) {
                        self.rootViewController = rootViewController;
                        [self makeKeyAndVisible];
                    }];
}


#pragma mark Simplify function
- (void) setRootViewController:(UIViewController *)rootViewController pushTransactionRoute:(CATransitionSubtype)transitionSubType duration:(CGFloat)duration backgroundColor:(UIColor*)color andBackgroundView:(UIView*)view {
    
    CATransition* transition = [CATransition animation];
    transition.type = kCATransitionPush;
    transition.subtype = transitionSubType;
    transition.duration = duration;
    [transition setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear]];
    
    [self setRootViewController:rootViewController withTransition:transition backgroundColor:color andBackgroundView:view];
}

- (void) setRootViewController:(UIViewController *)rootViewController pushTransactionRoute:(CATransitionSubtype)transitionSubType duration:(CGFloat)duration backgroundColor:(UIColor*)color andBackgroundImage:(UIImage*)image {
    
    UIImageView* imageView;
    if(image != nil) imageView = [[UIImageView alloc] initWithImage:image];
    
    [self setRootViewController:rootViewController pushTransactionRoute:transitionSubType duration:duration backgroundColor:color andBackgroundView:imageView];
}


- (void) setRootViewController:(UIViewController *)rootViewController pushManuallyRoute:(CATransitionSubtype)transitionSubType duration:(CGFloat)duration {
    [self setRootViewController:rootViewController withManuallyInAnimation:YES outAnimation:YES routeType:transitionSubType duration:duration options:0];
}



@end
