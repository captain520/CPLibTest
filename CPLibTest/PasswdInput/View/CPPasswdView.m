//
//  CPPasswdView.m
//  CPLibTest
//
//  Created by wangzhangchuan on 2017/12/18.
//  Copyright © 2017年 wangzhangchuan. All rights reserved.
//

#import "CPPasswdView.h"

@interface CPPasswdView()

@property (nonatomic, strong) NSMutableString *inputStr;
@property (nonatomic, strong) NSMutableString *secureStr;
@property (nonatomic, strong) NSDictionary *options;

@end

@implementation CPPasswdView

- (id)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        [self initializedBaseProperties];
        
        [self setupUpUI];
    }
    
    return self;
}

- (void)initializedBaseProperties {
    
    self.layer.borderColor      = UIColor.grayColor.CGColor;
    self.layer.borderWidth      = 1.0f;
    self.layer.cornerRadius     = 5.0f;
    self.userInteractionEnabled = YES;  //  一定要将该属性设置成可YES，否则软键盘出不来
    
    self.inputStr = @"".mutableCopy;
    self.secureStr = @"".mutableCopy;
    self.passwdLength = 6;
    
    
    //  计算密码字符位置
    NSMutableString * placeholderStr = @"".mutableCopy;
    
    for (NSInteger i = 0; i < self.passwdLength; ++i) {
        [placeholderStr appendFormat:@"*"];
    }
    
    NSAttributedString *tempStr = [[NSMutableAttributedString alloc] initWithString:placeholderStr
                                                                         attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:16.0f]}];
    
    
    CGSize size = [tempStr size];
    CGFloat offsetWithPerUint = (self.bounds.size.width - size.width) / self.passwdLength;
    NSMutableParagraphStyle *style = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
    style.firstLineHeadIndent = offsetWithPerUint / 2.0f;
    
    self.options = @{NSKernAttributeName : @(offsetWithPerUint),
                     NSForegroundColorAttributeName : UIColor.orangeColor,
                     NSFontAttributeName : [UIFont systemFontOfSize:16.0f]
                     ,
                     NSParagraphStyleAttributeName : style
                     }.copy;
    
    

    //  点击后使菜单变成可编辑状态
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showKeyBoard:)];
    
    [self addGestureRecognizer:tap];
}

//  绘制分割线
- (void)setupUpUI {
    
    CGFloat width  = self.bounds.size.width / self.passwdLength;
    CGFloat height = self.bounds.size.height;
    
    for (NSInteger i = 1; i < self.passwdLength; ++i) {
        
        UIView *line = [[UIView alloc] initWithFrame:CGRectMake(i * width, 0, 1, height)];
        line.backgroundColor = UIColor.grayColor;
        
        [self addSubview:line];
        
    }
}

#pragma mark - Delagate method implement

- (BOOL)hasText {
    return self.inputStr.length > 0;
}
- (void)insertText:(NSString *)text {

    //  只接受限定的密码长度
    if (self.inputStr.length < self.passwdLength) {
        [self.inputStr appendString:text];
        
        {
            [self.secureStr appendString:text];
            [self updateContent];
        }
    }
}
- (void)deleteBackward {

    if (self.inputStr.length > 0) {
        [self.inputStr deleteCharactersInRange:NSMakeRange(self.inputStr.length - 1, 1)];
        
        {
            [self.secureStr deleteCharactersInRange:NSMakeRange(self.secureStr.length - 1, 1)];
            [self updateContent];
        }
    }
}

- (BOOL)canBecomeFirstResponder {
    return YES;
}

- (UIKeyboardType)keyboardType {
    return UIKeyboardTypeNumberPad;
}


#pragma mark - Show keybooard

- (void)showKeyBoard:(id)gst {
    [self becomeFirstResponder];
}

- (void)updateContent {
    
    {
        //  替换除最后一个字符外的其他字符为*  eg: **********8
        NSMutableString *tempstr = @"".mutableCopy;
        for (NSInteger i = 0; i < self.secureStr.length - 1 && self.secureStr.length > 0; ++i) {
            [tempstr appendString:@"*"];
        }
        if (self.secureStr.length > 0) {
            [self.secureStr replaceCharactersInRange:NSMakeRange(0, self.secureStr.length - 1) withString:tempstr];
        }
        
        self.attributedText = [[NSAttributedString alloc] initWithString:self.secureStr attributes:self.options];
    }
    
    
    {
        //  在一秒后设置最后一个字符为"*"
        if (self.secureStr.length > 0) {
            [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(showWithSecurText:) object:nil];
            [self performSelector:@selector(showWithSecurText:) withObject:nil afterDelay:1.0f];
        }
    }
    
}

//  将最后一个字符串替换为"*"
- (void)showWithSecurText:(id)object {
    
    if (self.secureStr.length > 0) {
        NSInteger location = MAX(0, (NSInteger)(self.secureStr.length) - 1);
        [self.secureStr replaceCharactersInRange:NSMakeRange(location, 1) withString:@"*"];
    }
    
    self.attributedText = [[NSAttributedString alloc] initWithString:self.secureStr attributes:self.options];
}

@end
