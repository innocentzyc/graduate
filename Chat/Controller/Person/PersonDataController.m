//
//  PersonDataController.m
//  Chat
//
//  Created by 天真 on 2018/9/14.
//  Copyright © 2018年 zyc. All rights reserved.
//

#import "PersonDataController.h"

@interface PersonDataController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation PersonDataController

-(void)configUI
{
    [super configUI];
    self.title = @"个人信息";
    
    [self.view addSubview:self.tableView];
    
}

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
#pragma tableView

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 6;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identify = @"cellIdentify";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    NSArray *title = @[@"头像",@"姓名",@"性别",@"手机",@"地址",@"邮箱"];
    NSArray *data = @[@"http://b-ssl.duitang.com/uploads/item/201511/06/20151106181553_ZTFNW.jpeg",@"程浩宇",@"男",@"1347686578",@"浙江传媒学院",@"12776546@qq.com"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identify];
        
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
        UILabel *label = Label.str(title[indexPath.row]).fixWH(100,40).color(@"black").fnt(16);
        
        if(indexPath.row == 0)
        {
            UIImageView *image = ImageView.fixWH(60,60);
            [image sd_setImageWithURL:[NSURL URLWithString:data[indexPath.row]] placeholderImage:[UIImage imageNamed:@"me_normal"]];
            HorStack(label,NERSpring,image).embedIn(cell.contentView, 25 ,20,10,5);
        }
        else
        {
            UILabel *detail = Label.str(data[indexPath.row]).fixWH(cell.contentView.width-25,40).color(@"lightGray").fnt(15).rightAlignment;
            
            HorStack(label,NERSpring,detail).embedIn(cell.contentView, 5 ,20,5,5);
        }
    }
    
    return cell;
}



@end
