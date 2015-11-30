//
//  UIView+SendAction.m
//  SendAction
//
//  Created by 沈红榜 on 15/11/30.
//  Copyright © 2015年 沈红榜. All rights reserved.
//

#import "UIView+SendAction.h"

@implementation UIView (SendAction)

- (BOOL)shbSendAction:(SEL)action from:(id)sender {
    
    id target = sender;
    
    while (target && ![target canPerformAction:action withSender:sender]) {
        target = [target nextResponder];
    }
    if (!target) {
        return false;
    }
    
    return [[UIApplication sharedApplication] sendAction:action to:target from:sender forEvent:nil];
}

@end
