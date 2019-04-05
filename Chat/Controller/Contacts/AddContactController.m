//
//  AddContactController.m
//  Chat
//
//  Created by 天真 on 2018/9/11.
//  Copyright © 2018年 zyc. All rights reserved.
//

#import "AddContactController.h"

@interface AddContactController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UIView *searchView;

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *data;

@end

@implementation AddContactController
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
        if(x!=nil)
        [self.data addObject:[NSString stringWithFormat:@"%@",x]];
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
    }
    else{
        [self.data addObject:@"没有结果"];
    }
    [self.tableView reloadData];
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


@end
