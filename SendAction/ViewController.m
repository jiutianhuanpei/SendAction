//
//  ViewController.m
//  SendAction
//
//  Created by 沈红榜 on 15/11/30.
//  Copyright © 2015年 沈红榜. All rights reserved.
//

#import "ViewController.h"
#import "CustomCell.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@end

@implementation ViewController {
    UITableView         *_tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
    _tableView.rowHeight = 60;
    
    [_tableView registerClass:[CustomCell class] forCellReuseIdentifier:NSStringFromClass([CustomCell class])];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CustomCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([CustomCell class]) forIndexPath:indexPath];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%d", indexPath.row];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 15;
}


- (void)sendAction:(CustomCell *)sender {
    NSLog(@"%@", sender.textLabel.text);
}

- (void)kkPress:(CustomCell *)sender {
    NSIndexPath *indexPath = [_tableView indexPathForCell:sender];
    CGRect rect = [_tableView rectForRowAtIndexPath:indexPath];
    
//    UIMenuItem *copItem = [[UIMenuItem alloc] initWithTitle:@"copy" action:@selector(copy:)];
//    UIMenuController *menu = [UIMenuController sharedMenuController];
//    [menu setMenuItems:@[copItem]];
//    [menu setTargetRect:rect inView:_tableView];
//    [menu setMenuVisible:true animated:true];
    [self showMenuByIndexPath:indexPath];
}

- (void)showMenuByIndexPath:(NSIndexPath *)indexPath {
    CGRect rect = [_tableView rectForRowAtIndexPath:indexPath];
    
    UIMenuItem *copItem = [[UIMenuItem alloc] initWithTitle:@"copy" action:@selector(kkcopy:)];
    UIMenuItem *kkItem = [[UIMenuItem alloc] initWithTitle:@"kk" action:@selector(kkkkkk:)];
    
    UIMenuController *menu = [UIMenuController sharedMenuController];
    if (indexPath.row % 2 == 1) {
        [menu setMenuItems:@[copItem]];
    } else {
        [menu setMenuItems:@[copItem, kkItem]];
    }
    [menu setTargetRect:rect inView:_tableView];
    [menu setMenuVisible:true animated:true];
    [menu update];
    
}


- (void)kkcopy:(id)sender {
    
}

- (void)kkkkkk:(id)sender {
    
}

- (BOOL)canBecomeFirstResponder {
    return true;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
