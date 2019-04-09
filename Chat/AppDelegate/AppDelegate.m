//
//  AppDelegate.m
//  Chat
//
//  Created by 天真 on 2018/7/5.
//  Copyright © 2018年 zyc. All rights reserved.
//

#import "AppDelegate.h"
#import "CCMainTabBarViewController.h"
#import "LoginViewController.h"
#import <RongIMLib/RongIMLib.h>
#import <RongIMKit/RongIMKit.h>


@interface AppDelegate ()<RCIMUserInfoDataSource>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [self mainWindow];
    [self loginRongCloud];
    return YES;
}
//注册主界面
- (void)mainWindow
{
    self.window = [[UIWindow alloc]init];
    self.window.frame = [UIScreen mainScreen].bounds;
    
   // CCMainTabBarViewController *rootView = [[CCMainTabBarViewController alloc] init];
    LoginViewController *rootController = [[LoginViewController alloc]init];
    self.window.rootViewController = rootController;
    [self.window makeKeyAndVisible];
}
//登录融云
- (void)loginRongCloud
{
    [[RCIM sharedRCIM] initWithAppKey:@"n19jmcy5n8p49"];
    [[RCIM sharedRCIM] setUserInfoDataSource:self];
    //王可爱  iGaE3knqRMWtmQNprdAqFjYEQFKqdxPU2MwZwfHzA8f/mF+vz61MpYaiUnX5WBA2l3syQHtsQEKPq3B+Mv4n9A==
    //张天真  Xfg5tqXwQxImuBH4h6bmWJIKo406Vz4pwkoHxFIv9srTWc6mBiK+xyJ0q+hz670ilSSbWlut6l+8Ut+iLqBmGA==
    [[RCIM sharedRCIM] connectWithToken:@"iGaE3knqRMWtmQNprdAqFjYEQFKqdxPU2MwZwfHzA8f/mF+vz61MpYaiUnX5WBA2l3syQHtsQEKPq3B+Mv4n9A=="     success:^(NSString *userId) {
        NSLog(@"登陆成功。当前登录的用户ID：%@", userId);
    } error:^(RCConnectErrorCode status) {
        NSLog(@"登陆的错误码为:%ld", status);
    } tokenIncorrect:^{
        NSLog(@"token错误");
    }];
    
}
- (void)getUserInfoWithUserId:(NSString *)userId
                   completion:(void (^)(RCUserInfo *userInfo))completion
{
    if ([userId isEqualToString:@"Innocent"]) {
        return completion([[RCUserInfo alloc] initWithUserId:userId name:@"王可爱" portrait:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1536664051777&di=f2b41d170d3b29b884f97b8c697aa5f8&imgtype=0&src=http%3A%2F%2Fimg3.duitang.com%2Fuploads%2Fitem%2F201608%2F12%2F20160812005801_kKHTy.jpeg"]);
    }else
    {
       
        return completion([[RCUserInfo alloc] initWithUserId:userId name:@"张天真" portrait:@"http://img3.duitang.com/uploads/item/201407/24/20140724142257_vTrmv.jpeg"]);
        //http://img3.duitang.com/uploads/item/201407/24/20140724142257_vTrmv.jpeg
        //https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1536664051777&di=f2b41d170d3b29b884f97b8c697aa5f8&imgtype=0&src=http%3A%2F%2Fimg3.duitang.com%2Fuploads%2Fitem%2F201608%2F12%2F20160812005801_kKHTy.jpeg
    }
}




@end
