//
//  AddContactController.m
//  Chat
//
//  Created by 天真 on 2018/9/11.
//  Copyright © 2018年 zyc. All rights reserved.
//

#import "AddContactController.h"
#import "MainPersonController.h"

@interface AddContactController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UIView *searchView;

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *data;

@property (nonatomic, strong) ContactModel *model;

@property (nonatomic, strong) NSMutableArray *contactArray;

@end

@implementation AddContactController
#pragma mark ——— lazyLoad...
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

-(UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [UIView new];
    }
    return _tableView;
}

- (void)configUI
{
    [super configUI];
    self.title = @"添加联系人";
    
    self.searchView = View.fixWH(self.view.width,40).bgColor(@"white").border(1, @"#CCCCCC");
    
    VerStack(self.searchView,@10,self.tableView).embedIn(self.view, 10,0,0,0);
    
    UIImageView *image = ImageView.fixWH(40,40);
    
    image.image = [UIImage imageNamed:@"search"];
    
    UITextField *text = TextField.hint(@"手机号/昵称").color(@"black").fixWH(self.view.width-140,40).bgColor(@"white");
    
    [[text rac_textSignal]subscribeNext:^(id x) {
        self.data = [[NSMutableArray alloc]init];
    
        if(x!=nil){
        
            [self.data addObject:[NSString stringWithFormat:@"搜索：%@",x]];
            
            self.model = [[ContactModel alloc]init];
            self.model.name = [NSString stringWithFormat:@"%@",x];
            self.model.iconUrl = @"http://img3.duitang.com/uploads/item/201508/18/20150818151724_8xERY.jpeg";
            self.model.sign = [NSString stringWithFormat:@"聊天就找%@，%@最帅",self.model.name,self.model.name];
            self.model.phone = @"13465786845";
            self.model.remark = @"大帅哥";
            
            [self.contactArray addObject:self.model];
        }
        
        
        
        [self.tableView reloadData];
    }];
    
    UIButton *button = Button.bgColor(@"white").borderRadius(7).border(Screen.onePixel, @"#CCCCCC").fixWH(80,40).str(@"查找").fnt(14).onClick(^{
        [self getData:text.text];
    });
    
    HorStack(image,@10,text,NERSpring,button).embedIn(self.searchView,5,10,5,5);
    
}

- (void)getData:(NSString *)string
{
    self.data = [[NSMutableArray alloc]init];
    
    if([string isEqualToString:@"Jason"])
    {
        [self.data addObjectsFromArray:@[@"Jason",@"Tom Jason",@"Jack Jason",@"Loser Jason"]];
        
        [self.contactArray removeAllObjects];
        
        self.model = [[ContactModel alloc]init];
        self.model.name = @"Jason";
        self.model.iconUrl = @"http://img3.duitang.com/uploads/item/201508/18/20150818151724_8xERY.jpeg";
        self.model.sign = [NSString stringWithFormat:@"聊天就找%@，%@最帅",self.model.name,self.model.name];
        self.model.phone = @"13465786845";
        self.model.remark = @"大帅哥";
        
        [self.contactArray addObject:self.model];
        
        self.model = [[ContactModel alloc]init];
        self.model.name = @"Tom Jason";
        self.model.iconUrl = @"https://cdn.duitang.com/uploads/item/201602/05/20160205200523_fSRJv.jpeg";
        self.model.sign = [NSString stringWithFormat:@"聊天就找%@，%@最帅",self.model.name,self.model.name];
        self.model.phone = @"13465786845";
        self.model.remark = @"大帅哥";
        
        [self.contactArray addObject:self.model];
        
        self.model = [[ContactModel alloc]init];
        self.model.name = @"Jack Jason";
        self.model.iconUrl = @"http://img3.duitang.com/uploads/item/201511/07/20151107101230_mHuJF.jpeg";
        self.model.sign = [NSString stringWithFormat:@"聊天就找%@，%@最帅",self.model.name,self.model.name];
        self.model.phone = @"13465786845";
        self.model.remark = @"大帅哥";
        
        [self.contactArray addObject:self.model];
        
        self.model = [[ContactModel alloc]init];
        self.model.name = @"Loser Jason";
        self.model.iconUrl = @"http://img3.duitang.com/uploads/item/201407/24/20140724142257_vTrmv.jpeg";
        self.model.sign = [NSString stringWithFormat:@"聊天就找%@，%@最帅",self.model.name,self.model.name];
        self.model.phone = @"13465786845";
        self.model.remark = @"大帅哥";
        
        [self.contactArray addObject:self.model];

    }
    else{
        [self.data addObject:@"没有结果"];
    }
    [self.tableView reloadData];
}

#pragma tableView--delegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
   
    return self.data.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identify = @"cellIdentify";
   
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identify];
    }
    
    cell.textLabel.text = self.data[indexPath.row];
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    MainPersonController *vc = [[MainPersonController alloc] init];
    
    vc.model = self.contactArray[indexPath.row];
    
    vc.buttonTitle = @"加好友";
    
    [self.navigationController pushViewController:vc animated:YES];
}


@end
