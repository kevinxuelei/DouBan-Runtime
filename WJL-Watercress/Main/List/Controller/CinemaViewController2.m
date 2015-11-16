//
//  CinemaViewController2.m
//  WJL-Watercress
//
//  Created by 王剑亮 on 15/10/5.
//  Copyright (c) 2015年 wangjianliang. All rights reserved.
//

#import "CinemaViewController2.h"
#import "Cinema3TableViewCell.h"
@interface CinemaViewController2 ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataArray;

@end

@implementation CinemaViewController2

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        self.dataArray = [NSMutableArray array];
        [self loadTableView];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    

    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"btn_nav_back"] style:UIBarButtonItemStylePlain target:self action:@selector(leftClicked)];
    
//    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"btn_nav_share"] style:UIBarButtonItemStylePlain target:self action:@selector(rightClicked)];
//    

    
}


-(void)leftClicked
{
    //影院返回
    [self.navigationController popViewControllerAnimated:NO];
    
}


-(void)setModel:(Cinema2Model *)model
{
    NSMutableDictionary *broadcast = model.broadcast;
    
    for (NSDictionary *dic in broadcast) {
       
        Cinema3Model *model = [[Cinema3Model alloc] init];
        [model setValuesForKeysWithDictionary:dic];
        [self.dataArray addObject:model];
    }
    
    [_tableView reloadData];

}

//-(void)rightClicked
//{
//    
//}

//初始化tableView
- (void)loadTableView
{
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    //
    [self.tableView registerClass:[Cinema3TableViewCell class] forCellReuseIdentifier:@"CELL"];
}
//返回cell个数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}
//设置cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    Cinema3TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CELL" forIndexPath:indexPath];
    [cell binModel:self.dataArray[indexPath.row]];
    
    return cell;
}
//设置cell的高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == (self.dataArray.count - 1)) {
        return 180;
    }else{
        return 130;
    }
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
