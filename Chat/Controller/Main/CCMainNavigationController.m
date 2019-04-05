//
//  YSBaseNavigationController.m
//  MToy
//
//  Created by Magic-Yu on 2017/10/21.
//  Copyright © 2017年 beyondin. All rights reserved.
//

#import "CCMainNavigationController.h"

// C
#import "CCMainTabBarViewController.h"
// V

// M

// A

@interface CCMainNavigationController ()

@end

@implementation CCMainNavigationController

#pragma mark - 生命周期
- (void)viewDidLoad{
    
    [super viewDidLoad];
    
    
    UIGraphicsEndImageContext();
    

    UINavigationBar *bar = [UINavigationBar appearance];
    
    //设置字体颜色
    [bar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    
    // 隐藏导航栏底部线条
    [self.navigationBar setShadowImage:[UIImage new]];
    
    //导航栏颜色
    [self.navigationBar setBarTintColor:[UIColor colorWithRed:1.00 green:0.04 blue:0.32 alpha:1.00]];

    
}

+ (instancetype)initWithBackBtnAndRootViewController:(UIViewController *)viewController{
    
    CCMainNavigationController *nav = [[CCMainNavigationController alloc] initWithRootViewController:viewController];
    
    [nav.navigationItem setHidesBackButton:YES];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:@"ic_whitearrow"] forState:UIControlStateNormal];
    btn.frame = CGRectMake(0, 0, 44, 44);
    
    btn.imageEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 10);
    
    [btn addTarget:nav action:@selector(clickButton) forControlEvents:UIControlEventTouchUpInside];
    
    
    viewController.hidesBottomBarWhenPushed = YES;
    viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn];

    
    return nav;
    
}

#pragma mark - 重写
- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}


- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
  
    
    if (self.viewControllers.count > 0) {
        
        [self.navigationItem setHidesBackButton:YES];
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setImage:[UIImage imageNamed:@"ic_whitearrow"] forState:UIControlStateNormal];
        btn.frame = CGRectMake(0, 0, 44, 44);
        
        btn.imageEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 10);
        
        [btn addTarget:self action:@selector(clickButton) forControlEvents:UIControlEventTouchUpInside];

        viewController.hidesBottomBarWhenPushed = YES;
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn];

    }
    
    [super pushViewController:viewController animated:animated];
}




#pragma mark - 初始化

#pragma mark - 方法

#pragma mark - 事件
- (void)clickButton{
    
    if (self.viewControllers.count > 1) {
        [self popViewControllerAnimated:YES];
    }else{
        [[self.viewControllers lastObject] dismissViewControllerAnimated:YES completion:nil];
    }
}

#pragma mark - 网络请求

#pragma mark - 数据源

#pragma mark - 代理

#pragma mark - Get&Set


@end
