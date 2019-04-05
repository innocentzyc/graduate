//
//  LoginViewController.m
//  Chat
//
//  Created by 天真 on 2018/7/9.
//  Copyright © 2018年 zyc. All rights reserved.
//

#import "LoginViewController.h"
#import "MessageViewController.h"
#import "ResViewController.h"
#import "ForgotPasswordViewController.h"
#import "CCMainTabBarViewController.h"

@interface LoginViewController ()
@property (nonatomic ,strong) UITextField *username;
@property (nonatomic ,strong) UITextField *password;
@property (nonatomic ,strong) UIButton *logIn;
@property (nonatomic ,strong) UIButton *res;
@property (nonatomic ,strong) UIButton *forgetPassword;
@end

@implementation LoginViewController

- (void)configUI
{
    self.view.backgroundColor = UIColor.whiteColor;
    
    UIView *titleView = UIView.new.bgColor(CCRGBAColor(240, 240, 240, 1));
    
    titleView.addTo(self.view).makeCons(^{
        make.left.right.top.equal.superview.constants(0);
        make.height.equal.constants(SCREENH_HEIGHT/7);
    });
    
    
    UILabel *label = UILabel.new.fixWH(SCREEN_WIDTH, SCREENH_HEIGHT/7).str(@"PinkChat").fnt(20).centerAlignment.color(@"block");
    
    label.addTo(titleView).makeCons(^{
        make.center.equal.superview.constants(0);
    });
    
    Style(@"textfield").leftAlignment.fixWH(SCREEN_WIDTH-50,40).bgColor(CCRGBAColor(240, 240, 240, 1)).color(@"black");
    
    self.username = TextField.styles(@"textfield").hint(@"用户名/邮箱/手机号");
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 10, 40)];
    
    view.backgroundColor = CCRGBAColor(240, 240, 240, 1);
    
    self.username.leftView = view;
    
    self.username.leftViewMode = UITextFieldViewModeAlways;
   
    self.password = TextField.styles(@"textfield").hint(@"登录密码");
    
    UIView *view1 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 10, 40)];
    
    view1.backgroundColor = CCRGBAColor(240, 240, 240, 1);
    
    self.password.leftView = view1;
    
    self.password.leftViewMode = UITextFieldViewModeAlways;
    
    self.password.secureTextEntry = YES;
    
    self.logIn = UIButton.new.bgColor([UIColor colorWithRed:1.00 green:0.04 blue:0.32 alpha:1.00]).str(@"登    录").color(@"white").fnt(18).fixWH(SCREEN_WIDTH-50,40).borderRadius(10).onClick(^{
        CCMainTabBarViewController *vc = [[CCMainTabBarViewController alloc]init];
        [self presentViewController:vc animated:YES completion:nil];
    });
    self.res =UIButton.new.str(@"手机快速注册").fnt(16).color(UIColor.grayColor).onClick(^{
        ResViewController *vc = [[ResViewController alloc]init];
        [self presentViewController:vc animated:YES completion:nil];
    });
    
    self.forgetPassword = UIButton.new.str(@"忘记密码").fnt(16).color(UIColor.grayColor).onClick(^{
        ForgotPasswordViewController *vc = [[ForgotPasswordViewController alloc]init];
        [self presentViewController:vc animated:YES completion:nil];
    });
    
    id bottomButton = HorStack(@2,_res,NERSpring,_forgetPassword);
    
    VerStack(_username,@5,_password,@15,_logIn,@15,bottomButton ).embedIn(self.view ,0 ,25 ,SCREENH_HEIGHT/2 ,25).fixHeight(SCREENH_HEIGHT/3.5);
}
- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleDefault;
}

@end
