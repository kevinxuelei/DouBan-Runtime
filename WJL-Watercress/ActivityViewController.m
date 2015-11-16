//
//  ActivityViewController.m
//  WJL-Watercress
//
//  Created by 王剑亮 on 15/9/29.
//  Copyright (c) 2015年 wangjianliang. All rights reserved.
//

#import "ActivityViewController.h"
#import "ActivityNextViewController.h"
#import "ActivityTableViewCell.h"
#import "URLTools.h"
#import "ActivityModel.h"
#import "DataBasehandle.h"


@interface ActivityViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    __block NSMutableDictionary *_maindic ;
    DataBasehandle *db;
    ActivityModelevent1 *model;
}

@property (nonatomic, strong ) NSMutableArray *dataArray;
@property (nonatomic, strong ) UITableView *tableView;
@property (nonatomic, copy) ActivityModel *Model;


@end

@implementation ActivityViewController

//页面即将弹出的时候
-(void)viewWillAppear:(BOOL)animated
{
    
}
- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    //设置标题
    self.navigationItem.title = @"活动";
    //设置背景图片
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"bg_nav.png"] forBarMetrics:UIBarMetricsDefault];
    
    //生成tableView
    [self createtableView];
    
    //初始化模型数组
    
    //注册一下 UItableViewCell
    [_tableView registerClass:[ActivityTableViewCell class] forCellReuseIdentifier:@"CELL"];
    
    
    db = [[DataBasehandle alloc] init];
    [db openDB];
    //为了获取这个类 运行时的属性与对象值 创建model而已
    model = [[ActivityModelevent1 alloc] init];
    //创建 固定格式的表
    [db createtableName:@"activitymodel" model:model];
    self.dataArray =  [NSMutableArray arrayWithArray:[db selectAllTableName:@"activitymodel" Model:model]];
    
    if (self.dataArray.count == 0) {
        //网络下载数据 之前获取一下本地数据库的数据 哈哈！
        __block ActivityViewController *vc = self;
        [URLTools PostdataURL:@"http://project.lanou3g.com/teacher/yihuiyun/lanouproject/activitylist.php" datastring:@"" block:^(id object) {
            
            _maindic = object;
            //NSLog(@"%@",_maindic);
            //网络解析之后 就要解析出来模型
            [vc dataToModel];
        }];
    }


    

    
    


}

-(void)dataToModel
{

        self.dataArray = [NSMutableArray array];

    db = [[DataBasehandle alloc] init];
    [db openDB];

    
    //第一层解析
    _Model = [[ActivityModel alloc] init];
    for (id key in _maindic) {
        [_Model setValue:[_maindic objectForKey:key] forKey:key];
    }
    

    
    NSArray *arrayevent = [_maindic objectForKey:@"events"];
    NSLog(@"%ld",(unsigned long)arrayevent.count);
    for (int i = 0; i < arrayevent.count; i++)
    {

        //第二层解析
        _Model.events1 = [[ActivityModelevent1 alloc] init];
        NSMutableDictionary *dic1 = arrayevent[i];
        [_Model.events1 setValuesForKeysWithDictionary:dic1];

        NSMutableDictionary *dic2 =[dic1 objectForKey:@"owner"];
        _Model.events1.ownername = [dic2 objectForKey:@"name"];
        [self.dataArray addObject:_Model.events1];

        }
    

    //创建 固定格式的表
    [db createtableName:@"activitymodel" model:model];
    
    //添加数据
    for (ActivityModelevent1 *model1 in self.dataArray)
    {
        //插入这个表 必须传递 与建表时 一样的model！
      [db insertIntoTableName:@"activitymodel" model:model1];
    }

    
    //刷新一下界面 显示一下
    [_tableView reloadData];
    
}

-(void)createtableView
{
    self.tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.view addSubview:self.tableView];
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return  self.dataArray.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{

    
    if (indexPath.row == (self.dataArray.count-1)) {
        return 214;
    }
    else
    {
       return 160;
    }
    

    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //在CELL 重用池子里边 拿出来一个Cell 使用
    ActivityTableViewCell *cell =[tableView dequeueReusableCellWithIdentifier: @"CELL"];
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    ActivityModelevent1 *model;
    model = self.dataArray[indexPath.row];
    [cell setModel:model];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSLog(@"你点击了第%ld",(long)indexPath.row );
    ActivityNextViewController *vc = [[ActivityNextViewController alloc] init];
    [vc setModel:self.dataArray[indexPath.row]];
    [self.navigationController pushViewController:vc animated:NO];
    
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
