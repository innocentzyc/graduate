//
//  ContactCell.h
//  Chat
//
//  Created by 天真 on 2018/9/10.
//  Copyright © 2018年 zyc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ContactModel.h"

@interface ContactCell : UITableViewCell

@property (nonatomic, strong) ContactModel *cellModel;

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier  data:(ContactModel *)cellmodel;

@end
