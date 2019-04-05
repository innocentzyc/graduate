//
//  NewContactCell.h
//  Chat
//
//  Created by 天真 on 2018/9/15.
//  Copyright © 2018年 zyc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewContactCell : UITableViewCell

/** 是否显示agreed */
@property (nonatomic, strong) UIImageView *iconImageView;

@property (nonatomic, strong) UILabel *nameLabel;

@property (nonatomic, strong) UILabel *title;

@property (nonatomic, strong) UIButton *agree;

@property (nonatomic, strong) UIButton *refuse;

@property (nonatomic, strong) UILabel *agreed;

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier data:(NSArray *)data;


@end
