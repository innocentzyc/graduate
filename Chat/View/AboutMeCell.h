//
//  AboutMeCell.h
//  Chat
//
//  Created by 天真 on 2018/9/11.
//  Copyright © 2018年 zyc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ContactModel.h"

@interface AboutMeCell : UITableViewCell

@property (nonatomic, strong) ContactModel *model;

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier data:(ContactModel *)model;

@end
