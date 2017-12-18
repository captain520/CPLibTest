//
//  CPSpringAnimationVC.m
//  CPLibTest
//
//  Created by wangzhangchuan on 2017/12/18.
//  Copyright © 2017年 wangzhangchuan. All rights reserved.
//

#import "CPSpringAnimationVC.h"

@interface CPSpringAnimationVC ()

@end

@implementation CPSpringAnimationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Action method
- (IBAction)testButtonAction:(UIButton *)sender {
    
    CASpringAnimation *spring = [CASpringAnimation animation];
    spring.keyPath             = @"transform";
    spring.stiffness           = 100;
    spring.mass                = 10;
//    spring.damping             = 0;
    spring.fromValue           = [NSValue valueWithCATransform3D:sender.layer.transform];
    spring.toValue             = [NSValue valueWithCATransform3D:CATransform3DTranslate(sender.layer.transform, 50, 50, 50)];
    spring.duration            = spring.settlingDuration;
    spring.fillMode            = kCAFillModeForwards;
    spring.initialVelocity     = -20;
    spring.removedOnCompletion = NO;
    
    [sender.layer addAnimation:spring forKey:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
