//
//  CCObject.m
//  有余
//
//  Created by 天真 on 2017/12/16.
//  Copyright © 2017年 zyc. All rights reserved.
//

#import "CCObject.h"
#import "CCBaseViewController.h"
@interface CCObject ()
@end

@implementation CCObject

+(UILabel *)CreateIn:(CCBaseViewController *)VC
           withFrame:(CGRect)frame
                font:(NSInteger)font textColor:(UIColor *)color
                text:(NSString *)text
           alignment:(NSTextAlignment)alignment
{
    UILabel *label = [[UILabel alloc]initWithFrame:frame];
    label.text = text;
    label.textColor = color;
    label.font = [UIFont systemFontOfSize:font];
    label.textAlignment = alignment;
    return label;
}
+(UIImageView *)CreateIn:(CCBaseViewController *)VC
               withFrame:(CGRect)frame
         backgroundColor:(UIColor *)backgroundColor
                   image:(NSString *)imageString
{
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:frame];
    imageView.backgroundColor = backgroundColor;
    imageView.image = [UIImage imageNamed:imageString];
    return imageView;
}
+(UITextField *)CreateIn:(CCBaseViewController *)VC
               withFrame:(CGRect)frame
                    font:(NSInteger)font secrect:(BOOL)secret
         backgroundColor:(UIColor *)backgroundColor
               textColor:(UIColor *)textColor
                    text:(NSString *)text
               alignment:(NSTextAlignment)alignment
                leftView:(UIView *)leftView
             placeHolder:(NSString *)palceHolder
{
    UITextField *textField = [[UITextField alloc]initWithFrame:frame];
    textField.font = [UIFont systemFontOfSize:font];
    textField.secureTextEntry = secret;
    textField.backgroundColor = backgroundColor;
    textField.textColor = textColor;
    textField.textAlignment = alignment;
    textField.text = text;
    textField.leftView = leftView;
    textField.placeholder = palceHolder;
    if(palceHolder){
    NSMutableAttributedString *holder = [[NSMutableAttributedString alloc] initWithString:palceHolder];
    [holder addAttribute:NSFontAttributeName
                        value:[UIFont boldSystemFontOfSize:14]
                        range:NSMakeRange(0, palceHolder.length)];
    textField.attributedPlaceholder = holder;
    }
    if(leftView)
        textField.leftViewMode = UITextFieldViewModeAlways;
    return textField;
}
+(UIButton *)CreateIn:(CCBaseViewController *)VC
            withFrame:(CGRect)frame
                 font:(NSInteger)font
                title:(NSString *)title
        selectedTitle:(NSString *)selectedTitle
      backgroundColor:(UIColor *)backgroundColor
                image:(NSString *)image
        selectedImage:(NSString *)selectedImage
               action:(SEL)action
            textColor:(UIColor *)textColor
{
    UIButton *button = [[UIButton alloc]initWithFrame:frame];
    button.titleLabel.font = [UIFont systemFontOfSize:font];
    [button setTitleColor:textColor forState:UIControlStateNormal];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitle:selectedTitle forState:UIControlStateSelected];
    [button setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:selectedImage] forState:UIControlStateSelected];
    button.backgroundColor = backgroundColor;
    [button addTarget:VC action:action forControlEvents:UIControlEventTouchUpInside];
    
    return button;
}
+(UIView *)CreateIn:(CCBaseViewController *)VC
          withFrame:(CGRect)frame
              image:(NSString *)image
    backgroundColor:(UIColor *)backgroundColor
{
    UIView *view = [[UIView alloc]initWithFrame:frame];
    view.backgroundColor = backgroundColor;
    [self CreateIn:nil withFrame:frame backgroundColor:nil image:image];
    view.userInteractionEnabled = YES;
    return view;
}
+(UISwitch *)CreateIn:(CCBaseViewController *)VC
            withFrame:(CGRect)frame
            tintColor:(UIColor *)tintColor
          onTintColor:(UIColor *)onTintColor
       thumbTintColor:(UIColor *)thumbTintColor
               action:(SEL)action
{
    UISwitch *SSwitch = [[UISwitch alloc]initWithFrame:frame];
    SSwitch.tintColor = tintColor;
    SSwitch.onTintColor = onTintColor;
    SSwitch.thumbTintColor = thumbTintColor;
    [SSwitch addTarget:VC action:action forControlEvents:UIControlEventValueChanged];
    Switch.on = NO;
    return SSwitch;
}
+(UIBarButtonItem *)CreateIn:(CCBaseViewController *)VC
                       title:(NSString *)title
                  titleColor:(UIColor *)titleColor
                       image:(UIImage *)image
                      action:(SEL)action
{
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 20, 20)];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:titleColor forState:UIControlStateNormal];
    [button setImage:image forState:UIControlStateNormal];
    [button addTarget:VC action:action forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc]initWithCustomView:button];
    return barButtonItem;
}

@end
