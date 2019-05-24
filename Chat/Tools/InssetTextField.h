//
//  InssetTextField.h
//  Chat
//
//  Created by 天真 on 2018/7/20.
//  Copyright © 2018年 zyc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InssetTextField : UITextField

- (CGRect)textRectForBounds:(CGRect)bounds;

- (CGRect)editingRectForBounds:(CGRect)bounds;

@end
