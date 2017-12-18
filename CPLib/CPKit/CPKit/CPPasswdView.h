//
//  CPPasswdView.h
//  CPLibTest
//
//  Created by wangzhangchuan on 2017/12/18.
//  Copyright © 2017年 wangzhangchuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CPPasswdView : UILabel<UIKeyInput>

@property (nonatomic, strong) UIView *inputView;
@property (nonatomic, strong) UIView *inputAccessoryView;

@property (nonatomic, assign) NSInteger passwdLength;

@end
