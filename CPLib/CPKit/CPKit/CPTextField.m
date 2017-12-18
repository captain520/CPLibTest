//
//  CPTextField.m
//  CPKit
//
//  Created by wangzhangchuan on 2017/12/16.
//  Copyright © 2017年 wangzhangchuan. All rights reserved.
//

#import "CPTextField.h"

@interface CPTextField()<UITextFieldDelegate> {
@private CGColorRef saveBoardColor;
}

@end

@implementation CPTextField

- (id)init {
    
    if (self = [super init]) {
        
        self.delegate = self;
        
        self.maxStrLength = INTMAX_MAX;
    }
    
    return self;
}

- (id)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        self.delegate = self;
        self.maxStrLength = INTMAX_MAX;
        
        saveBoardColor = self.layer.borderColor;
    }
    
    return self;
}

#pragma mark - Setter && Getter methods

- (void)setCursorColor:(UIColor *)cursorColor {
    
    _cursorColor = cursorColor;
    
    self.tintColor = cursorColor;
}

#pragma mark - UITextFieldDelegate method
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    if ([string isEqualToString:@""]) {
        return YES;
    }
    
    if (textField.text.length >= self.maxStrLength) {
        
        [self showHintToast:@"输入字符数超过最大长度"];
        
        return NO;
    }

    return YES;
}


- (void)textFieldDidBeginEditing:(UITextField *)textField {
    self.layer.borderWidth = 1.0f;
    self.layer.cornerRadius = 3.0f;
    self.layer.borderColor = UIColor.orangeColor.CGColor;
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    self.layer.borderWidth = 1.0f;
    self.layer.borderColor = UIColor.clearColor.CGColor;
}

- (void)showHintToast:(NSString *)des {
    
    UIMenuItem *menuItem = [[UIMenuItem alloc] initWithTitle:des action:@selector(action:)];
    
    UIMenuController *controller = [UIMenuController sharedMenuController];
    controller.menuItems = @[menuItem];
    controller.menuVisible = YES;
    
    [controller setTargetRect:self.bounds inView:self];
    [controller update];
}

- (void)action:(id)sender {
    
}

- (BOOL)isValideParams {
    
    if (self.text.length >= self.maxStrLength) {
        return NO;
    }
    
    return YES;
}

- (BOOL) canPerformAction:(SEL)selector withSender:(id) sender
{
    
    if ([self isValideParams] == NO) {
        return selector == @selector(action:);
    }
    
    return YES;
}

@end
