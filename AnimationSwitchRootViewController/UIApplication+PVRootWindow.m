//
//  UIApplication+PVRootWindow.m
//  AnimationSwitchRootViewController
//
//  Created by Короткий Виталий (ViR) on 29.10.17.
//  Copyright © 2017 ProVir. All rights reserved.
//

#import "UIApplication+PVRootWindow.h"

@implementation UIApplication (PVRootWindow)

+ (UIWindow*) sharedWindow {
    return [[[self sharedApplication] delegate] window];
}

@end
