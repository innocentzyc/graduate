//
//  ResViewController.m
//  Chat
//
//  Created by 天真 on 2018/7/9.
//  Copyright © 2018年 zyc. All rights reserved.
//

#import "ResViewController.h"
#import <CommonCrypto/CommonDigest.h>

@interface ResViewController ()
@property (nonatomic ,strong) UITextField *phoneNum;
@property (nonatomic ,strong) UITextField *password;
@property (nonatomic ,strong) UITextField *configPw;
@property (nonatomic ,strong) UITextField *name;
@property (nonatomic ,strong) UIButton *res;

@end

@implementation ResViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
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
    
    UILabel *label = UILabel.new.fixWH(SCREEN_WIDTH, SCREENH_HEIGHT/7).str(@"注册PinkChat").fnt(20).centerAlignment.color(@"block");
    
    label.addTo(titleView).makeCons(^{
        make.center.equal.superview.constants(0);
    });
    
    Style(@"textfield").leftAlignment.fixWH(SCREEN_WIDTH-50,40).bgColor(CCRGBAColor(240, 240, 240, 1)).color(@"black");
    
    self.phoneNum = TextField.styles(@"textfield").hint(@"请输入手机号");
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 10, 40)];
    
    view.backgroundColor = CCRGBAColor(240, 240, 240, 1);
    
    self.phoneNum.leftView = view;
    
    self.phoneNum.leftViewMode = UITextFieldViewModeAlways;
    
    self.password = TextField.styles(@"textfield").hint(@"请设置登录密码");
    
    UIView *view1 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 10, 40)];
    
    view1.backgroundColor = CCRGBAColor(240, 240, 240, 1);
    
    self.password.leftView = view1;
    
    self.password.leftViewMode = UITextFieldViewModeAlways;
    
    self.password.secureTextEntry = YES;
    
    self.configPw = TextField.styles(@"textfield").hint(@"请确认密码");
    
    UIView *view2 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 10, 40)];
    
    view1.backgroundColor = CCRGBAColor(240, 240, 240, 1);
    
    self.configPw.leftView = view2;
    
    self.configPw.leftViewMode = UITextFieldViewModeAlways;
    
    self.configPw.secureTextEntry = YES;
    
    self.name = TextField.styles(@"textfield").hint(@"请设置昵称");
    
    UIView *view3 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 10, 40)];
    
    view.backgroundColor = CCRGBAColor(240, 240, 240, 1);
    
    self.name.leftView = view3;
    
    self.name.leftViewMode = UITextFieldViewModeAlways;
    
    self.res = UIButton.new.bgColor([UIColor colorWithRed:1.00 green:0.04 blue:0.32 alpha:1.00]).str(@"注册").color(@"white").fnt(18).fixWH(SCREEN_WIDTH-50,40).borderRadius(10).onClick(^{
        
    });
    
    VerStack(_phoneNum,@5,_password,@5,_configPw,@5,_name,@25,_res).embedIn(self.view ,0 ,25 ,SCREENH_HEIGHT/2 ,25).fixHeight(SCREENH_HEIGHT/3.5);
}

- (void)getIMTokenWithPhoneNum:(NSString *)phoneNum name:(NSString *)name
{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    NSString *urlstr =@"https://api.cn.rong.io/user/getToken.json";
    
    NSDictionary *dic =@{@"userId":phoneNum,
                         
                         @"name":name,
                         
                         @"portraitUri":@"http://img3.duitang.com/uploads/item/201407/24/20140724142257_vTrmv.jpeg"
                         
                         };
    
    //这几句是按融云的提示写的
    
    NSString * timestamp = [[NSString alloc] initWithFormat:@"%ld",(NSInteger)[NSDate timeIntervalSinceReferenceDate]];
    
    NSString * nonce = [NSString stringWithFormat:@"%d",arc4random()];
    
    NSString * appkey = @"n19jmcy5n8p49";
    
    NSString *SignatureWillMD5 = [NSString stringWithFormat:@"%@%@%@",appkey,nonce,timestamp];//这个要加密
    
    NSString *Signature = [self MD5String:SignatureWillMD5];
    
    //以下拼接请求内容
    
    [manager.requestSerializer setValue:appkey forHTTPHeaderField:@"App-Key"];
    
    [manager.requestSerializer setValue:nonce forHTTPHeaderField:@"Nonce"];
    
    [manager.requestSerializer setValue:timestamp forHTTPHeaderField:@"Timestamp"];
    
    [manager.requestSerializer setValue:Signature forHTTPHeaderField:@"Signature"];
    
    [manager.requestSerializer setValue:@"6KQHFraKVNpR" forHTTPHeaderField:@"appSecret"];
    
    [manager.requestSerializer setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    
    //开始请求
    
    [manager POST:urlstr parameters:dic progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@",responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",[error description]);
    }];
    
}

- (NSString *)MD5String:(NSString *)str {
    
    const char *cStr = [str UTF8String];
    
    unsigned char result[16];
    
    CC_MD5(cStr, (CC_LONG)strlen(cStr), result); // This is the md5 call
    
    NSString * md5Str = [NSString stringWithFormat:
                         
                         @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
                         
                         result[0], result[1], result[2], result[3],
                         
                         result[4], result[5], result[6], result[7],
                         
                         result[8], result[9], result[10], result[11],
                         
                         result[12], result[13], result[14], result[15]
                         
                         ];
    
    return md5Str;
    
}

@end
