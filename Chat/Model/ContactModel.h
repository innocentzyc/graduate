//
//  ContactModel.h
//  Chat
//
//  Created by 天真 on 2018/9/10.
//  Copyright © 2018年 zyc. All rights reserved.
//

#import "CCBaseModel.h"

@interface ContactModel : CCBaseModel

/** 头像url */
@property (nonatomic, copy) NSString *iconUrl;

/** 名字 */
@property (nonatomic, copy) NSString *name;

/** 手机号 */
@property (nonatomic, copy) NSString *phone;

/** 签名 */
@property (nonatomic, copy) NSString *sign;

/** 备注 */
@property (nonatomic, copy) NSString *remark;

@end
