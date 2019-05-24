//
//  InssetTextField.m
//  Chat
//
//  Created by 天真 on 2018/7/20.
//  Copyright © 2018年 zyc. All rights reserved.
//

#import "InssetTextField.h"

@implementation InssetTextField

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}


//控制文本所在的的位置，左右缩 10
- (CGRect)textRectForBounds:(CGRect)bounds {
    return CGRectInset( bounds , 10 , 0 );
}

//控制编辑文本时所在的位置，左右缩 10
- (CGRect)editingRectForBounds:(CGRect)bounds {
    return CGRectInset( bounds , 10 , 0 );
}  

@end
