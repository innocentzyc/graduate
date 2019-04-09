//
//  ForgotPasswordViewController.m
//  Chat
//
//  Created by 天真 on 2018/7/20.
//  Copyright © 2018年 zyc. All rights reserved.
//

#import "ForgotPasswordViewController.h"

@interface ForgotPasswordViewController ()
@property (nonatomic ,strong) UITextField *phoneNum;
@property (nonatomic ,strong) UITextField *password;
@property (nonatomic ,strong) UITextField *ver;
@property (nonatomic ,strong) UIButton *forget;

@end

@implementation ForgotPasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)configUI
{
    self.view.backgroundColor = UIColor.whiteColor;
    
    UIView *titleView = UIView.new.bgColor(CCRGBAColor(240, 240, 240, 1));
    
    titleView.addTo(self.view).makeCons(^{
        make.left.right.top.equal.superview.constants(0);
        make.height.equal.constants(SCREENH_HEIGHT/7);
    });
    
    UIButton *back = UIButton.new.bgColor([UIColor clearColor]).str(@"返回").color(@"gray").fnt(16).borderRadius(10).onClick(^{
        [self dismissViewControllerAnimated:YES completion:nil];
    });
    
    back.frame = CGRectMake(10, 50, 40, 40);
    
    [titleView addSubview:back];
    
    UILabel *label = UILabel.new.fixWH(SCREEN_WIDTH, SCREENH_HEIGHT/7).str(@"忘记密码").fnt(20).centerAlignment.color(@"block");
    
    label.addTo(titleView).makeCons(^{
        make.center.equal.superview.constants(0);
    });
    
    Style(@"textfield").leftAlignment.fixWH(SCREEN_WIDTH-50,40).bgColor(CCRGBAColor(240, 240, 240, 1)).color(@"black");
    
    self.phoneNum = TextField.styles(@"textfield").hint(@"请输入手机号");
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 10, 40)];
    
    view.backgroundColor = CCRGBAColor(240, 240, 240, 1);
    
    self.phoneNum.leftView = view;
    
    self.phoneNum.leftViewMode = UITextFieldViewModeAlways;
    
    self.password = TextField.styles(@"textfield").hint(@"请设置新登录密码");
    
    UIView *view1 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 10, 40)];
    
    view1.backgroundColor = CCRGBAColor(240, 240, 240, 1);
    
    self.password.leftView = view1;
    
    self.password.leftViewMode = UITextFieldViewModeAlways;
    
    self.password.secureTextEntry = YES;
    
    self.ver = TextField.styles(@"textfield").hint(@"请输入验证码");
    
    UIView *view2 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 10, 40)];
    
    view1.backgroundColor = CCRGBAColor(240, 240, 240, 1);
    
    self.ver.leftView = view2;
    
    self.ver.leftViewMode = UITextFieldViewModeAlways;
    
    self.ver.secureTextEntry = YES;
    
    self.forget = UIButton.new.bgColor([UIColor colorWithRed:1.00 green:0.04 blue:0.32 alpha:1.00]).str(@"找回").color(@"white").fnt(18).fixWH(SCREEN_WIDTH-50,40).borderRadius(10).onClick(^{
        
    });
    
    VerStack(_phoneNum,@5,_password,@5,_ver,@25,_forget).embedIn(self.view ,0 ,25 ,SCREENH_HEIGHT/1.7 ,25).fixHeight(SCREENH_HEIGHT/5);
}



@end
