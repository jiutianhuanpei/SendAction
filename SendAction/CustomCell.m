//
//  CustomCell.m
//  SendAction
//
//  Created by 沈红榜 on 15/11/30.
//  Copyright © 2015年 沈红榜. All rights reserved.
//

#import "CustomCell.h"
#import "UIView+SendAction.h"

@interface CustomCell ()<UITextFieldDelegate>

@end

@implementation CustomCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
        btn.frame = CGRectMake(20, 10, 80, 40);
        [btn setTitle:@"btn" forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(clickedBtn) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
        
        UILongPressGestureRecognizer *press = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPr:)];
        [self addGestureRecognizer:press];
        
        UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(110, 10, 70, 40)];
        textField.layer.borderColor = [UIColor grayColor].CGColor;
        textField.layer.borderWidth = 1 / [UIScreen mainScreen].scale;
        textField.delegate = self;
        [self addSubview:textField];
        
    }
    return self;
}

-  (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return true;
}

- (void)clickedBtn {
    [self shbSendAction:@selector(sendAction:) from:self];
}

- (void)longPr:(UILongPressGestureRecognizer *)press {
    if (press.state == UIGestureRecognizerStateBegan) {
        [self shbSendAction:@selector(kkPress:) from:self];
    }
    
}

@end
