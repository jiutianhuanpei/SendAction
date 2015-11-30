//
//  CustomCell.m
//  SendAction
//
//  Created by 沈红榜 on 15/11/30.
//  Copyright © 2015年 沈红榜. All rights reserved.
//

#import "CustomCell.h"
#import "UIView+SendAction.h"


@implementation CustomCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
        btn.frame = CGRectMake(20, 10, 80, 40);
        [btn setTitle:@"btn" forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(clickedBtn) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
    }
    return self;
}

- (void)clickedBtn {
    [self shbSendAction:@selector(sendAction:) from:self];
}

@end
