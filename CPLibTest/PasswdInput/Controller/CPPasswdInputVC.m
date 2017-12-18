//
//  CPPasswdInputVC.m
//  CPLibTest
//
//  Created by wangzhangchuan on 2017/12/18.
//  Copyright © 2017年 wangzhangchuan. All rights reserved.
//

#import "CPPasswdInputVC.h"
#import "CPPasswdView.h"

@interface CPPasswdInputVC ()


@end

@implementation CPPasswdInputVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    [self testPasswdInputTF];
    [self testPasswdView];
}

- (void)testPasswdView {
    
    CPPasswdView *passwdView = [[CPPasswdView alloc] initWithFrame:CGRectMake(50, 100, 300, 50)];
    
    [self.view addSubview:passwdView];

}

- (void)testPasswdInputTF {
    
//    CPPasswdTextFiled *tf = [[CPPasswdTextFiled alloc] initWithFrame:CGRectMake(100, 100, 100, 50)];
//    tf.layer.borderColor = [UIColor grayColor].CGColor;
//    tf.layer.borderWidth = 1.0f;
//
//
//    [self.view addSubview:tf];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
