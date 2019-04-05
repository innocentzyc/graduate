//
//  MessageViewController.m
//  Chat
//
//  Created by 天真 on 2018/7/5.
//  Copyright © 2018年 zyc. All rights reserved.
//

#import "MessageViewController.h"
#import <RongIMKit/RongIMKit.h>

@interface MessageViewController ()

@end

@implementation MessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setDisplayConversationTypes:@[@(ConversationType_PRIVATE)]];
    self.conversationListTableView.separatorStyle = NO;
}
- (void)onSelectedTableRow:(RCConversationModelType)conversationModelType
         conversationModel:(RCConversationModel *)model
               atIndexPath:(NSIndexPath *)indexPath {
    RCConversationViewController *conversationVC = [[RCConversationViewController alloc]init];
    conversationVC.conversationType = model.conversationType;
    conversationVC.targetId = model.targetId;
    conversationVC.title = model.conversationTitle;
    [self.navigationController pushViewController:conversationVC animated:YES];
}
-(RCConversationBaseCell *)rcConversationListTableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    RCConversationCell *cell = [[RCConversationCell alloc]init];
    
    return cell;
}

@end
