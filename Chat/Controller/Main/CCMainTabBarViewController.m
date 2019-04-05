//
//  YSBaseTabBarViewController.m
//  MToy
//
//  Created by Magic-Yu on 2017/10/21.
//  Copyright © 2017年 beyondin. All rights reserved.
//

#import "CCMainTabBarViewController.h"

// C
#import "CCMainNavigationController.h"
#import "CCBaseViewController.h"


// V

// M

// A

@interface CCMainTabBarViewController ()

@property (nonatomic,assign) NSInteger  indexFlag;
//记录上一次点击tabbar，使用时，记得先在init或viewDidLoad里 初始化 = 0
@end

@implementation CCMainTabBarViewController

#pragma mark - 生命周期


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.indexFlag = 0;
    
    // 基本配置
    [self config];
    
}

#pragma mark - 重写






#pragma mark - 初始化
// 基本配置
- (void)config{
    
    
    
    // 设置tabbar主题色
    [UITabBar appearance].tintColor = MainColor;
    [[UITabBar appearance] setBackgroundColor:[UIColor whiteColor]];

    
    
    // 设置文字颜色
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor colorWithRed:1.00 green:0.04 blue:0.32 alpha:1.00] , NSForegroundColorAttributeName, nil] forState:UIControlStateSelected];
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor lightGrayColor], NSForegroundColorAttributeName, nil] forState:UIControlStateNormal];

    
    // 创建子视图
    [self configViewControllers];
    
    self.selectedIndex = 1;
    
    
    
}

- (void)configViewControllers{
    
    
    NSArray *vcNames = @[@"ContactsViewController", @"MessageViewController", @"PersonViewController"];
    NSArray *titles = @[@"联系人", @"消息", @"我"];
    NSArray<NSString *> *images = @[@"contact", @"message" ,@"me"];
    
    NSMutableArray *vcs = [@[] mutableCopy];
    
    [vcNames enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        NSString *vcName = obj;
        NSString *title = titles[idx];
        NSString *normalImage = [images[idx] stringByAppendingString:@"_normal"];
        NSString *selectImage = [images[idx] stringByAppendingString:@"_select"];
        
        CCMainNavigationController *nav = [self createSubControllerWithVcName:vcName andTitle:title andNormalImage:normalImage andSelectImage:selectImage];
        
        [vcs addObject:nav];
        
    }];
    
    self.viewControllers = [vcs copy];
    
}

#pragma mark - 方法
// 子视图创建方法
- (CCMainNavigationController *)createSubControllerWithVcName:(NSString *)VcName andTitle:(NSString *)titile andNormalImage:(NSString *)normalImage andSelectImage:(NSString *)selectImage{
    
    CCBaseViewController *vc = [[NSClassFromString(VcName) alloc] init];
    
    UITabBarItem *tabBarItem = [[UITabBarItem alloc] initWithTitle:titile
                                                             image:[[UIImage imageNamed:normalImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]
                                                     selectedImage:[[UIImage imageNamed:selectImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    vc.tabBarItem = tabBarItem;
    
    vc.title = titile;
    
    CCMainNavigationController *nav = [[CCMainNavigationController alloc] initWithRootViewController:vc];
    
    
    return nav;
    
}

#pragma mark - 事件

#pragma mark - 网络请求

#pragma mark - 数据源

#pragma mark - 代理
-(void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item{
    NSInteger index = [self.tabBar.items indexOfObject:item];
    
    if (index != self.indexFlag) {
        //执行动画
        NSMutableArray *arry = [NSMutableArray array];
        
        for (UIView *btn in self.tabBar.subviews) {
            
            if ([btn isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
                [arry addObject:btn];
            }
        }
        //添加动画
        //放大效果，并回到原位
        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
        
        //速度控制函数，控制动画运行的节奏
        animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        
        animation.duration = 0.2;       //执行时间
        
        animation.repeatCount = 1;      //执行次数
        
        animation.autoreverses = YES;    //完成动画后会回到执行动画之前的状态
        
        animation.fromValue = [NSNumber numberWithFloat:1.2];   //初始伸缩倍数
        
        animation.toValue = [NSNumber numberWithFloat:1];     //结束伸缩倍数
        
        [[arry[index] layer] addAnimation:animation forKey:nil];
        
        self.indexFlag = index;
    }
}

#pragma mark - Get&Set



@end
