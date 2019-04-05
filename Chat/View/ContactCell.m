//
//  ContactCell.m
//  Chat
//
//  Created by 天真 on 2018/9/10.
//  Copyright © 2018年 zyc. All rights reserved.
//

#import "ContactCell.h"

@interface ContactCell()

@property (nonatomic, strong) UIImageView *iconImageView;
@property (nonatomic, strong) UILabel *nameLabel;

@end

@implementation ContactCell

- (ContactModel *)cellModel
{
    if(!_cellModel)
        _cellModel = [[ContactModel alloc]init];
    return _cellModel;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier data:(ContactModel *)cellModel
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _cellModel = cellModel;
        _iconImageView = ImageView.fixWH(50,50).borderRadius(7).border(Screen.onePixel, @"#CCCCCC");
        [_iconImageView sd_setImageWithURL:[NSURL URLWithString:cellModel.iconUrl] placeholderImage:[UIImage imageNamed:@"me_normal"]];
        _nameLabel = Label.fnt(17).color(@"black").fixWH(self.bounds.size.width-20,50).leftAlignment;
        _nameLabel.text = cellModel.name;
        HorStack(_iconImageView,@10,_nameLabel).embedIn(self.contentView , 5,20,5,0);
    }
    return self;
}
@end
