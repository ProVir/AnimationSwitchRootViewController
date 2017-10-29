//
//  UIApplication+PVRootWindow.h
//  AnimationSwitchRootViewController
//
//  Created by Короткий Виталий (ViR) on 29.10.17.
//  Copyright © 2017 ProVir. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@interface UIApplication (PVRootWindow)

+ (nullable UIWindow*) sharedWindow;

@end
NS_ASSUME_NONNULL_END
