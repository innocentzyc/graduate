


#import <UIKit/UIKit.h>

@interface CCMainNavigationController : UINavigationController


/**
 创建首页带返回按钮的nav

 @param viewController 根控制器
 @return 实例
 */
+ (instancetype)initWithBackBtnAndRootViewController:(UIViewController *)viewController;

@end
