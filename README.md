# SendAction
一个UIView的扩展，可以发送view的点击事件，见Demo

```object
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
```
