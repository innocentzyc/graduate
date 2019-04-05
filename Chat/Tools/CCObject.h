//
//  CCObject.h
//  有余
//
//  Created by 天真 on 2017/12/16.
//  Copyright © 2017年 zyc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CCBaseViewController.h"

@interface CCObject : UIViewController
+(UILabel *)CreateIn:(CCBaseViewController *)VC
           withFrame:(CGRect)frame
                font:(NSInteger)font textColor:(UIColor *)color
                text:(NSString *)text
           alignment:(NSTextAlignment)alignment;

+(UIImageView *)CreateIn:(CCBaseViewController *)VC
               withFrame:(CGRect)frame
         backgroundColor:(UIColor *)backgroundColor
                   image:(NSString *)imageString;

+(UITextField *)CreateIn:(CCBaseViewController *)VC
               withFrame:(CGRect)frame
                    font:(NSInteger)font secrect:(BOOL)secret
         backgroundColor:(UIColor *)backgroundColor
               textColor:(UIColor *)textColor
                    text:(NSString *)text
               alignment:(NSTextAlignment)alignment
                leftView:(UIView *)leftView
             placeHolder:(NSString *)palceHolder;

+(UIButton *)CreateIn:(CCBaseViewController *)VC
            withFrame:(CGRect)frame
                 font:(NSInteger)font
                title:(NSString *)title
        selectedTitle:(NSString *)selectedTitle
      backgroundColor:(UIColor *)backgroundColor
                image:(NSString *)image
        selectedImage:(NSString *)selectedImage
               action:(SEL)action
            textColor:(UIColor *)textColor;
+(UIView *)CreateIn:(CCBaseViewController *)VC
          withFrame:(CGRect)frame
              image:(NSString *)image
    backgroundColor:(UIColor *)backgroundColor;
+(UISwitch *)CreateIn:(CCBaseViewController *)VC
            withFrame:(CGRect)frame
            tintColor:(UIColor *)tintColor
          onTintColor:(UIColor *)onTintColor
       thumbTintColor:(UIColor *)thumbTintColor
               action:(SEL)action;
+(UIBarButtonItem *)CreateIn:(CCBaseViewController *)VC
                       title:(NSString *)title
                  titleColor:(UIColor *)titleColor
                       image:(UIImage *)image
                      action:(SEL)action;
@end
