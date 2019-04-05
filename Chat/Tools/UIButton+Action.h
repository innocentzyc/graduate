//
//  UIButton+Action.h
//  demoTsou
//
//  Created by Tsou on 2018/7/16.
//  Copyright © 2018年 Tsou. All rights reserved.
//


#import <UIKit/UIKit.h>

typedef void (^ActionBlock)(UIButton *button);

@interface UIButton (Action)

@property (nonatomic,copy) ActionBlock actionBlock;

+ (UIButton *)createBtnWithFrame:(CGRect)frame title:(NSString *)title actionBlock:(ActionBlock)actionBlock;

@end
