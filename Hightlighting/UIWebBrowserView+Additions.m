//
//  UIWebBrowserView+Additions.m
//  Hightlighting
//
//  Created by Tabbie on 1/7/13.
//  Copyright (c) 2013 Tabbie. All rights reserved.
//

#import "UIWebBrowserView+Additions.h"

@implementation UIWebBrowserView (UIWebBrowserView_Additions)

//create custom UIMenuController with UIMenuItems that we desire only
- (BOOL)canPerformAction:(SEL)action withSender:(id)sender {
    if (action == @selector(select:))
    {
        return YES;
    }

    {
        return NO;
    }
}

@end


