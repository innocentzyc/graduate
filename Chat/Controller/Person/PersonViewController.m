//
//  PersonViewController.m
//  Chat
//
//  Created by 天真 on 2018/7/5.
//  Copyright © 2018年 zyc. All rights reserved.
//

#import "PersonViewController.h"
#import "ContactModel.h"
#import "AboutMeCell.h"
#import "PersonDataController.h"
#import "SettingController.h"

@interface PersonViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) ContactModel *model;

@end

@implementation PersonViewController

- (void)viewWillAppear:(BOOL)animated
{
    [self.tableView reloadData];
}

#pragma mark ——— mark lazyLoad
- (ContactModel *)model
{
    if(!_model)
        _model = [[ContactModel alloc]init];
    return _model;
}


-(void)configUI
{
    [super configUI];
    self.tableView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.tableFooterView = [UIView new];
    [self.view addSubview:self.tableView];
    [self getData];
}
//网络请求
- (void)getData
{
    self.model.name = @"程浩宇";
    self.model.sign = @"聊天就找程浩宇，程浩宇最帅";
    self.model.iconUrl = @"http://b-ssl.duitang.com/uploads/item/201511/06/20151106181553_ZTFNW.jpeg";
}

#pragma mark ——— tableView
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row == 0)
    {
        AboutMeCell *cell = [[AboutMeCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"1" data:self.model];
        cell.userInteractionEnabled = NO;
        return cell;
    }
    else
    {
        UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"2"];
        
        cell.selectionStyle = UITableViewCellSelectionStyleDefault;
        
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
        UIImageView *image = ImageView.fixWH(30,30);
        
        UILabel *label = Label.fixWH(cell.contentView.width-40,30).color(@"color").fnt(13).leftAlignment;
        
        if(indexPath.row == 1)
        {
            image.image = [UIImage imageNamed:@"person"];
            label.str(@"个人信息");
        }
        else
        {
            image.image = [UIImage imageNamed:@"setting"];
            label.str(@"设置");
        }
        
        HorStack(image,@10,label).embedIn(cell.contentView, 10,5,10,5);
        
        return  cell;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    indexPath.row == 1
    ? [self.navigationController pushViewController:[[PersonDataController alloc]init] animated:YES ]
    : [self.navigationController pushViewController:[[SettingController alloc]init] animated:YES ] ;
}


@end
