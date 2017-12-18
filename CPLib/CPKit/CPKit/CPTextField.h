//
//  CPTextField.h
//  CPKit
//
//  Created by wangzhangchuan on 2017/12/16.
//  Copyright © 2017年 wangzhangchuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CPTextField : UITextField

@property (nonatomic, assign) NSInteger maxStrLength;

@property (nonatomic, strong) UIColor *cursorColor; //  设置光标颜色，如果要不显示光标则设置颜色为: UIColor.clearColor;

@end

