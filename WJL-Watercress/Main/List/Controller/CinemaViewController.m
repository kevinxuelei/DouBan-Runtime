//
//  CinemaViewController.m
//  WJL-Watercress
//
//  Created by 王剑亮 on 15/9/29.
//  Copyright (c) 2015年 wangjianliang. All rights reserved.
//

#import "CinemaViewController.h"
#import "CinemaTableViewCell.h"
#import "CinemaModel.h"
#import "URLTools.h"
#import "CinemaViewController1.h"
#import "DataBasehandle.h"
@interface CinemaViewController ()<UITableViewDataSource,UITableViewDelegate>
{

    NSDictionary *_maindic;
        DataBasehandle *db;
        NSString *filename;

}

@property (nonatomic, strong ) NSMutableArray *dataArray;
@property (nonatomic, strong ) UITableView *tableView;
@end

@implementation CinemaViewController

//页面即将弹出的时候
-(void)viewWillAppear:(BOOL)animated
{
    
    
}


- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.title = @"影院";
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"bg_nav.png"] forBarMetrics:UIBarMetricsDefault];
    
    //生成tableView
    [self createtableView];
    

    
    //注册一下 UItableViewCell
    [_tableView registerClass:[CinemaTableViewCell class] forCellReuseIdentifier:@"CELL"];
}

-(void)createtableView
{
    self.tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.view addSubview:self.tableView];
    
    
    filename = @"ChinemaModel";
    db = [[DataBasehandle alloc] init];
    [db openDB];
    //为了运行时 获取准确地存储 属性 必须重写init方法 并且赋值想要存储的属性！！！！！
    CinemaModel *model = [[CinemaModel alloc] init];
    //创建 固定格式的表
    [db createtableName:filename model:model];
    [db selectAllTableName:filename Model:model];
    self.dataArray =  [NSMutableArray arrayWithArray:[db selectAllTableName:filename Model:model]];
    

    if (self.dataArray.count == 0)
    {
        __block CinemaViewController *vc = self;
        //从网络上获取数据 之后解析一下 放在model上 添加到数组上
        [URLTools GetdataURL:@"http://project.lanou3g.com/teacher/yihuiyun/lanouproject/cinemalist.php" block:^(id object) {
            
            _maindic = object;
            NSLog(@"%@",_maindic);
            //网络解析之后 就要解析出来模型
            [vc dataToModel];
            
        }];
    }

    
}


-(void)dataToModel
{
    
    //初始化模型数组
    self.dataArray = [NSMutableArray array];
    db = [[DataBasehandle alloc] init];
    [db openDB];
    
        NSDictionary *arraydic = [_maindic objectForKey:@"result"];
        NSArray *array1 = [arraydic objectForKey:@"data"];
    
        for (NSDictionary *dic in array1)
        {
            CinemaModel *model = [[CinemaModel alloc] init];
            for (NSString *key in dic) {

                [model setValue:[dic objectForKey:key] forKey:key];
            }
            [self.dataArray addObject:model];
        }


    //为了运行时 获取准确地存储 属性 必须重写init方法 并且赋值想要存储的属性！！！！！
    CinemaModel *model = [[CinemaModel alloc] init];
    //创建 固定格式的表
    [db createtableName:filename model:model];
    //添加数据
    for (CinemaModel *model in self.dataArray)
    {
        [db insertIntoTableName:filename model:model];
    }

    
    [_tableView reloadData];

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
       return  self.dataArray.count;

}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{

    return 160;

}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    //在CELL 重用池子里边 拿出来一个Cell 使用
    CinemaTableViewCell *cell =[tableView dequeueReusableCellWithIdentifier: @"CELL"];
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    CinemaModel *model = self.dataArray[indexPath.row];
    [cell setModeltwo:model];
    
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSLog(@"你点击了第%ld",(long)indexPath.row );
    
    CinemaViewController1 *vc = [[CinemaViewController1 alloc] init];
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
