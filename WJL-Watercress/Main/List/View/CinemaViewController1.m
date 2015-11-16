//
//  CinemaViewController1.m
//  WJL-Watercress
//
//  Created by 王剑亮 on 15/10/3.
//  Copyright (c) 2015年 wangjianliang. All rights reserved.
//

#import "CinemaViewController1.h"
#import "CinemaViewController2.h"
#import "URLTools.h"
#import "Cinema2Model.h"
#import "Cinema2TableViewCell.h"
#import "UIImageView+WebCache.h"
@interface CinemaViewController1 ()<UITableViewDelegate,UITableViewDataSource>
{
    __block NSMutableDictionary *_maindic ;
    
}

@property (nonatomic, strong ) NSMutableArray *dataArray;

@property (nonatomic, strong ) UITableView *tableView;

@end

@implementation CinemaViewController1

- (void)viewDidLoad {
    [super viewDidLoad];


    self.title = @"影院详情";
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"btn_nav_back"] style:UIBarButtonItemStylePlain target:self action:@selector(leftClicked)];
    
//    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"btn_nav_share"] style:UIBarButtonItemStylePlain target:self action:@selector(rightClicked)];


    self.dataArray = [NSMutableArray array];
    self.tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.view addSubview:self.tableView];
    
    
}

-(void)leftClicked
{
    //影院返回
    [self.navigationController popViewControllerAnimated:NO];
    
}

//-(void)rightClicked
//{
//
//}

-(void)setModel:(CinemaModel *)model
{
    _maindic = [[NSMutableDictionary alloc] init];

    __block CinemaViewController1 *vc = self;
    [URLTools PostdataURL:
     [NSString stringWithFormat:@"http://project.lanou3g.com/teacher/yihuiyun/lanouproject/searchcinema.php?cinemaId=%ld",(long)[model.id integerValue]]
     
     
     
              datastring:[NSString stringWithFormat:@"%@",model.id  ] block:^(id object) {
                  
                  _maindic = object;
                  NSLog(@"%@",_maindic);
                  //网络解析之后 就要解析出来模型
                  [vc dataToModel];
                  
              }];

}

-(void)dataToModel
{
    

    
   NSMutableDictionary *reusultdic = [_maindic objectForKey:@"result"];
   NSArray *listArray = [reusultdic objectForKey:@"lists"];
    
    for (NSMutableDictionary *dic in listArray) {
        
         Cinema2Model *model = [[Cinema2Model alloc] init];
        [model setValuesForKeysWithDictionary:dic];
        [self.dataArray addObject:model];
    }
    
    [_tableView reloadData];
    
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{

    return 200;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return  self.dataArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static  NSString *str = @"CELL";  //池子的名字 哈哈哈哈
    static int i = 0;
    //在CELL 重用池子里边 拿出来一个Cell 使用
    Cinema2TableViewCell *cell =[tableView dequeueReusableCellWithIdentifier: str];
    
    if(!cell)
    {
        //如果重用磁子里边 没有cell 放到cell 池子里边
        cell = [[Cinema2TableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:str];
        NSLog(@"cell");
        i++;
    }
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    Cinema2Model *model = self.dataArray[indexPath.row];
    
    [cell setModel:model];
    
    
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSLog(@"你点击了第%ld",(long)indexPath.row );
    //传过去第二个model 创建第三个model  并建立cell
    Cinema2Model *model = self.dataArray[indexPath.row];
    
    CinemaViewController2 *vc = [[CinemaViewController2 alloc] init];
    [vc setModel:model];
    
    [self.navigationController pushViewController:vc animated:YES];
    
    
    
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
