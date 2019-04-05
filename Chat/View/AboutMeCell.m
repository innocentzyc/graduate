//
//  AboutMeCell.m
//  Chat
//
//  Created by 天真 on 2018/9/11.
//  Copyright © 2018年 zyc. All rights reserved.
//

#import "AboutMeCell.h"

@interface AboutMeCell ()

@property (nonatomic, strong) UILabel *nameLabel;

@property (nonatomic, strong) UILabel *signLabel;

@property (nonatomic, strong) UIImageView *iconImageView;

@end

@implementation AboutMeCell

- (ContactModel *)model
{
    if(!_model)
    {
        _model = [[ContactModel alloc]init];
    }
    return _model;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier data:(ContactModel *)model
{
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        _model = model;
        
        self.selectionStyle = NO;
        
        _nameLabel = Label.str(model.name).fnt(20).fixWH(100,40).leftAlignment.color(@"black");
        
        _signLabel = Label.str(model.sign).fnt(13).fixWH(250,40).leftAlignment.color(@"lightGray");
        
        _iconImageView = ImageView.fixWH(50,50);
        
        [_iconImageView sd_setImageWithURL:[NSURL URLWithString:model.iconUrl] placeholderImage:[UIImage imageNamed:@"me_normal"]];
        
        id first =  HorStack(_nameLabel, NERSpring,_iconImageView);
        
        VerStack(first,@20,_signLabel).embedIn(self, 20,20,30,20);
    }
    return self;
}

@end
