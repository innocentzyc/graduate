//
//  NewContactController.m
//  Chat
//
//  Created by 天真 on 2018/9/14.
//  Copyright © 2018年 zyc. All rights reserved.
//

#import "NewContactController.h"
#import "NewContactCell.h"

@interface NewContactController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation NewContactController

#pragma mark lazy loading...
-(UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [UIView new];
    }
    return _tableView;
}

#pragma tableView--delegate


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identify = @"cellIdentify";
    NSArray *array = @[@[@"http://img3.duitang.com/uploads/item/201506/07/20150607235730_shEVc.jpeg",@"小西瓜"],@[@"http://img3.duitang.com/uploads/item/201407/24/20140724142257_vTrmv.jpeg",@"郑美丽"],@[@"http://b-ssl.duitang.com/uploads/item/201511/06/20151106181553_ZTFNW.jpeg",@"MM豆先生"],@[@"http://img3.duitang.com/uploads/item/201511/07/20151107101230_mHuJF.jpeg",@"-冬青-"],@[@"https://cdn.duitang.com/uploads/item/201602/05/20160205200523_fSRJv.jpeg",@"榴莲味de香水"]];
    NewContactCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (!cell) {
        
        cell = [[NewContactCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identify data:array[indexPath.row]];
        cell.selectionStyle = NO;
        id sec  = VerStack(cell.nameLabel,cell.title);
        if(indexPath.row==0)
        {
       HorStack(cell.iconImageView,@10,sec,NERSpring,cell.refuse,@5,cell.agree).embedIn(cell.contentView, 5 ,10,5,10);
            
            [[cell.refuse rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
                [cell.refuse removeFromSuperview];
                [cell.agree removeFromSuperview]; HorStack(cell.iconImageView,@10,sec,NERSpring,cell.agreed).embedIn(cell.contentView, 5 ,10,5,10);
            }];
            cell.agree.onClick(^{
                [cell.refuse removeFromSuperview];
                [cell.agree removeFromSuperview]; HorStack(cell.iconImageView,@10,sec,NERSpring,cell.agreed).embedIn(cell.contentView, 5 ,10,5,10);

            });
        }
        else
        {
           HorStack(cell.iconImageView,@10,sec,NERSpring,cell.agreed).embedIn(cell.contentView, 5 ,10,5,10);
        }
    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"新联系人";
}
-(void)configUI
{
    [super configUI];
    [self.view addSubview:self.tableView];
}



@end
