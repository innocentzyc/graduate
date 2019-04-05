//
//  UIButton+Action.m
//  demoTsou
//
//  Created by Tsou on 2018/7/16.
//  Copyright © 2018年 Tsou. All rights reserved.
//

#import "UIButton+Action.h"
#import <objc/runtime.h>

@implementation UIButton (Action)
static NSString *keyOfMethod;




+ (UIButton *)createBtnWithFrame:(CGRect)frame title:(NSString *)title actionBlock:(ActionBlock)actionBlock{
    UIButton *button = [[UIButton alloc]init];
    button.frame = frame;
    [button setTitle:title forState:UIControlStateNormal];
    [button addTarget:button action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    objc_setAssociatedObject (button , &keyOfMethod, actionBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
    
    return button;
}
- (void)buttonClick:(UIButton *)button{

    //通过key获取被关联对象
    //objc_getAssociatedObject(id object, const void *key)
    ActionBlock block = (ActionBlock)objc_getAssociatedObject(button, &keyOfMethod);
    if(block){
        block(button);
    }

    
}

- (void)setActionBlock:(ActionBlock)actionBlock{
    objc_setAssociatedObject (self, &keyOfMethod, actionBlock, OBJC_ASSOCIATION_COPY_NONATOMIC );
}

- (ActionBlock)actionBlock{
    return objc_getAssociatedObject (self ,&keyOfMethod);
}


@end
