//
//  ContactsViewController.m
//  Chat
//
//  Created by 天真 on 2018/7/5.
//  Copyright © 2018年 zyc. All rights reserved.
//

#import "ContactsViewController.h"
#import "AddContactController.h"
#import "NewContactController.h"
#import "MainPersonController.h"
#import "ContactModel.h"
#import "ContactCell.h"

@interface ContactsViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) ContactModel *model;

@property (nonatomic, strong) NSMutableArray *contactArray;

@end

@implementation ContactsViewController

- (void)viewWillAppear:(BOOL)animated
{
    [self.tableView reloadData];
}

#pragma mark ——— lazyLoad
- (ContactModel *)model
{
    if(!_model)
    {
        _model = [[ContactModel alloc]init];
    }
    return _model;
}

- (NSMutableArray *)contactArray
{
    if(!_contactArray)
    {
        _contactArray = [[NSMutableArray alloc]init];
    }
    return _contactArray;
}
#pragma mark ——— 
- (void)configUI
{
    [super configUI];
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 30, 30)];
    
    [[btn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        [self.navigationController pushViewController:[[AddContactController alloc]init] animated:YES];
    }];
    
    [btn setImage:[UIImage imageNamed:@"add"] forState:UIControlStateNormal];
    
    UIBarButtonItem *right = [[UIBarButtonItem alloc]initWithCustomView:btn];
   
    self.navigationItem.rightBarButtonItem = right;
    
    self.tableView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    
    self.tableView.delegate = self;
    
    self.tableView.dataSource = self;
    
    self.tableView.tableFooterView = [UIView new];//不显示多余的分割线
    
    [self.view addSubview:self.tableView];
    
    [self getData];
}
//网络请求
- (void)getData
{
    self.model.name = @"张天真";
    self.model.iconUrl = @"http://img3.duitang.com/uploads/item/201407/24/20140724142257_vTrmv.jpeg";
    self.model.sign = [NSString stringWithFormat:@"聊天就找%@，%@最美丽",self.model.name,self.model.name];
    self.model.phone = @"13465786845";
    self.model.remark = @"大美女";
    
    [self.contactArray addObject:self.model];
    
    self.model = [[ContactModel alloc]init];
    self.model.name = @"桃儿罐头";
    self.model.iconUrl = @"http://b-ssl.duitang.com/uploads/item/201707/23/20170723110429_jEKLn.jpeg";
    self.model.sign = [NSString stringWithFormat:@"聊天就找%@，%@最帅",self.model.name,self.model.name];
    self.model.phone = @"13465786845";
    self.model.remark = @"大帅哥";
    
    [self.contactArray addObject:self.model];
    
    self.model = [[ContactModel alloc]init];
    self.model.name = @"榴莲味de香水";
    self.model.iconUrl = @"http://img3.duitang.com/uploads/item/201508/18/20150818151724_8xERY.jpeg";
    self.model.sign = [NSString stringWithFormat:@"聊天就找%@，%@最帅",self.model.name,self.model.name];
    self.model.phone = @"13465786845";
    self.model.remark = @"大帅哥";
    
    [self.contactArray addObject:self.model];
    
    self.model = [[ContactModel alloc]init];
    self.model.name = @"-冬青-";
    self.model.iconUrl = @"https://cdn.duitang.com/uploads/item/201602/05/20160205200523_fSRJv.jpeg";
    self.model.sign = [NSString stringWithFormat:@"聊天就找%@，%@最帅",self.model.name,self.model.name];
    self.model.phone = @"13465786845";
    self.model.remark = @"大帅哥";
    
    [self.contactArray addObject:self.model];
    
    self.model = [[ContactModel alloc]init];
    self.model.name = @"鱼丸没有圆滚滚";
    self.model.iconUrl = @"http://img3.duitang.com/uploads/item/201511/07/20151107101230_mHuJF.jpeg";
    self.model.sign = [NSString stringWithFormat:@"聊天就找%@，%@最帅",self.model.name,self.model.name];
    self.model.phone = @"13465786845";
    self.model.remark = @"大帅哥";
    
    [self.contactArray addObject:self.model];

    //    self.model = [[ContactModel alloc]init];
//    self.model.name = @"MM豆先生";
//    self.model.iconUrl = @"http://img3.duitang.com/uploads/item/201407/24/20140724142257_vTrmv.jpeg";
//    self.model.sign = [NSString stringWithFormat:@"聊天就找%@，%@最帅",self.model.name,self.model.name];
//    self.model.phone = @"13465786845";
//    self.model.remark = @"大帅哥";
//    [self.contactArray addObject:self.model];

    
}
#pragma mark ——— tableView

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.contactArray.count+1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row == 0)
    {
        UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellID"];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        UIImageView *image = ImageView.fixWH(40,35);
        image.image = [UIImage imageNamed:@"news"];
        UILabel *label = Label.fixWH(cell.contentView.width-40,40).str(@"新的好友").fnt(17);
        HorStack(image,@25,label).embedIn(cell.contentView, 5,25,5,10);
        return cell;
    }
    else
    {
        static NSString *rid=@"id";
        
        ContactCell *cell=[tableView dequeueReusableCellWithIdentifier:rid];
        
        if(!cell){
            
            cell=[[ContactCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:rid data:self.contactArray[indexPath.row-1]];
        }
        
        return cell;
    }

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row ==0)
    {
        [self.navigationController pushViewController:[[NewContactController alloc]init] animated:YES];
    }
    else
    {
        MainPersonController *vc = [[MainPersonController alloc]init];
        vc.model = self.contactArray[indexPath.row-1];
        vc.buttonTitle = @"发消息";
        [self.navigationController pushViewController:vc animated:YES];
    }
}

@end
