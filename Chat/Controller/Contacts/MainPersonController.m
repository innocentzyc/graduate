//
//  MainPersonController.m
//  Chat
//
//  Created by 天真 on 2018/9/15.
//  Copyright © 2018年 zyc. All rights reserved.
//

#import "MainPersonController.h"
#import <RongIMKit/RongIMKit.h>

@interface MainPersonController ()

@property (nonatomic, strong) UILabel *nameLabel;

@property (nonatomic, strong) UILabel *signLabel;

@property (nonatomic, strong) UIImageView *iconImageView;

@property (nonatomic, strong) UILabel *phoneLabel;

@property (nonatomic, strong) UILabel *remarkLabel;

@end

@implementation MainPersonController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"详情";
}
-(void)configUI
{
    [super configUI];
    
    self.view.bgColor(CCRGBAColor(240, 240, 240, 1));
    
    UIView *back = View.bgColor(@"white").xywh(10,10,SCREEN_WIDTH-20,150);
    
    [self.view addSubview:back];
    _nameLabel = Label.str(self.model.name).fnt(20).fixWH(200,40).leftAlignment.color(@"black");
    
    _signLabel = Label.str(self.model.sign).fnt(13).fixWH(250,40).leftAlignment.color(@"lightGray");
    
    _iconImageView = ImageView.fixWH(50,50);
    
    [_iconImageView sd_setImageWithURL:[NSURL URLWithString:self.model.iconUrl] placeholderImage:[UIImage imageNamed:@"me_normal"]];
    
    id first =  HorStack(_nameLabel, NERSpring,_iconImageView);
    
    VerStack(first,@20,_signLabel).embedIn(back, 20,20,30,20);
    
    UIView *back1 = View.bgColor(@"white").xywh(0,10+back.height+30,SCREEN_WIDTH,90);
    
    [self.view addSubview:back1];
    
    NSString *str1 = [NSString stringWithFormat:@"手机    %@",self.model.phone];
    
    NSString *str2 = [NSString stringWithFormat:@"备注    %@",self.model.remark];
    
    _phoneLabel = Label.str(str1).fnt(16).fixWH(200,40).leftAlignment.color(@"black");
    
    UIView *line = View.bgColor(CCRGBAColor(240, 240, 240, 1)).fixWH(SCREEN_WIDTH,1.2);
    
    _remarkLabel = Label.str(str2).fnt(16).fixWH(200,40).leftAlignment.color(@"black");
    
    VerStack(_phoneLabel,line,_remarkLabel).embedIn(back1,5,10,5,10);
    
    UIButton *chat = UIButton.new.bgColor([UIColor colorWithRed:1.00 green:0.04 blue:0.32 alpha:1.00]).str(self.buttonTitle).color(@"white").fnt(18).xywh(25,SCREENH_HEIGHT-200, SCREEN_WIDTH-50,40).borderRadius(10).onClick(^{
        RCConversationViewController *conversationVC = [[RCConversationViewController alloc]init];
        conversationVC.conversationType = ConversationType_PRIVATE;
        conversationVC.targetId = @"bad";
        conversationVC.title = self.model.name;
        [self.navigationController pushViewController:conversationVC animated:YES];
    });
    
    [self.view addSubview:chat];
}

@end
