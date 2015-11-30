//
//  UIView+SendAction.m
//  SendAction
//
//  Created by 沈红榜 on 15/11/30.
//  Copyright © 2015年 沈红榜. All rights reserved.
//

#import "UIView+SendAction.h"

@implementation UIView (SendAction)

- (BOOL)shbSendAction:(SEL)acton from:(id)sender {
    
    id taget = sender;
    
    while (taget && ![taget canPerformAction:acton withSender:taget]) {
        taget = [taget nextResponder];
    }
    if (!taget) {
        return false;
    }
    
    return [[UIApplication sharedApplication] sendAction:acton to:taget from:sender forEvent:nil];
}

@end
