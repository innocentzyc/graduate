//
//  NewContactCell.m
//  Chat
//
//  Created by 天真 on 2018/9/15.
//  Copyright © 2018年 zyc. All rights reserved.
//

#import "NewContactCell.h"

@interface NewContactCell ()





@end

@implementation NewContactCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier data:(NSArray *)data;
{
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        _iconImageView = ImageView.fixWH(50,50);
        [_iconImageView sd_setImageWithURL:[NSURL URLWithString:data[0]] placeholderImage:[UIImage imageNamed:@"me_normal"]];
        _nameLabel = Label.str(data[1]).color(@"black").fnt(17).fixWH(150,25);
        _title = Label.str(@"请求添加你为好友").fnt(12).color(@"lightGray").fixWH(100,25);
        
        _agreed = Label.str(@"已同意").fnt(15);
        
        _agree = Button.bgColor(MainColor).borderRadius(10).str(@"同意").fixWH(50,30).fnt(14);
        
        _refuse = Button.bgColor(@"lightGray").borderRadius(10).str(@"拒绝").fixWH(50,30).fnt(14);
        
        
        
        
        
    }
    return self;
}

@end
