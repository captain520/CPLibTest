//
//  CPPasswdTextFiled.m
//  CPLibTest
//
//  Created by wangzhangchuan on 2017/12/18.
//  Copyright © 2017年 wangzhangchuan. All rights reserved.
//

#import "CPPasswdTextFiled.h"

@implementation CPPasswdTextFiled

- (id)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {

        [self initializedBaseProperties];
        [self setupUI];
    }
    
    return self;
}

- (void)initializedBaseProperties {
    
    self.secureTextEntry = YES;
    //        self.tintColor = UIColor.clearColor;
    self.font = [UIFont systemFontOfSize:16.0f];
    self.layer.cornerRadius = 5.0f;
    self.textAlignment = NSTextAlignmentCenter;
}

- (void)setupUI {
    
    CGFloat width = self.frame.size.width / 6.0f;
    CGFloat height = self.frame.size.height;
    
    for (NSInteger i = 0; i < 6; ++i) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(i * width, 0, width, height)];
        label.textAlignment = NSTextAlignmentCenter;
        label.backgroundColor = UIColor.redColor;
        label.text = @"-";

        [self addSubview:label];
    }
}

@end
