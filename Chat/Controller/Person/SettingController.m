//
//  SettingController.m
//  Chat
//
//  Created by 天真 on 2018/9/14.
//  Copyright © 2018年 zyc. All rights reserved.
//

#import "SettingController.h"
#import "LoginViewController.h"

@interface SettingController ()
@end


@implementation SettingController

-(void)configUI
{
    [super configUI];
    self.title = @"设置";
    
    GroupTV(Section(Row.disclosure.str(@"新消息通知"),Row.disclosure.str(@"隐私"),Row.disclosure.str(@"通用")),
            Section(Row.disclosure.str(@"帮助中心"),Row.disclosure.str(@"意见反馈"),Row.disclosure.str(@"关于")),
            Section(Row.str(@"                           退出登录").fnt(19).color(@"red").onClick(^{
        
        [self presentViewController:[[LoginViewController alloc]init] animated:YES completion:nil];
    }))).
    embedIn(self.view);
}

@end
