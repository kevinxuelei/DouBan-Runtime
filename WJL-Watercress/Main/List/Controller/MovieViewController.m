//
//  MovieViewController.m
//  WJL-Watercress
//
//  Created by 王剑亮 on 15/9/29.
//  Copyright (c) 2015年 wangjianliang. All rights reserved.
//

#import "MovieViewController.h"
#import "MovieTableViewCell.h"
#import "JSONKit.h"
#import "URLTools.h"
#import "MovieModel.h"
#import "moviedetailViewController.h"
#import "UIImageView+WebCache.h"
#import "DataBasehandle.h"
#import "MovieCollectionViewCell.h"
@interface MovieViewController ()<UITableViewDelegate,UITableViewDataSource,UICollectionViewDataSource,UICollectionViewDelegate>
{
    NSDictionary *_maindic;
    DataBasehandle *db;
    NSString *filename;
}
@property (nonatomic, strong ) NSMutableArray *dataArray;
@property (nonatomic, strong ) UITableView *tableView;
@property (nonatomic, strong)  UICollectionView *collection;
@end

@implementation MovieViewController

//页面即将弹出的时候
-(void)viewWillAppear:(BOOL)animated
{
    //生成tableView
    [self createtableView];
    

    
    //注册一下 UItableViewCell
    [_tableView registerClass:[MovieTableViewCell class] forCellReuseIdentifier:@"CELL"];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"btn_nav_collection.png"] style:UIBarButtonItemStylePlain target:self action:@selector(rightClicked)];
    
    
    filename = @"MovieModel";
    db = [[DataBasehandle alloc] init];
    [db openDB];
    //为了运行时 获取准确地存储 属性 必须重写init方法 并且赋值想要存储的属性！！！！！
    MovieModel *model = [[MovieModel alloc] init];
    //创建 固定格式的表
    [db createtableName:filename model:model];
    [db selectAllTableName:filename Model:model];
    self.dataArray =  [NSMutableArray arrayWithArray:[db selectAllTableName:filename Model:model]];
    

    
    if (self.dataArray.count == 0)
    {
        __block MovieViewController *vc = self;
        //从网络上获取数据 之后解析一下 放在model上 添加到数组上
        [URLTools GetdataURL:@"http://project.lanou3g.com/teacher/yihuiyun/lanouproject/movielist.php" block:^(id object) {
            _maindic = object;
            NSLog(@"%@",_maindic);
            
            //        //网络解析之后 就要解析出来模型
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
    
    NSArray *array = [_maindic objectForKey:@"result"];
    for (NSDictionary *dic in array)
    {
        MovieModel *model = [[MovieModel alloc] init];
        for (NSString *key in dic) {

            
            [model setValue:[dic objectForKey:key] forKey:key];
        }
    
        [self.dataArray addObject:model];
    }
    
    //为了运行时 获取准确地存储 属性 必须重写init方法 并且赋值想要存储的属性！！！！！
    MovieModel *model = [[MovieModel alloc] init];
    //创建 固定格式的表
    [db createtableName:filename model:model];
    
    //添加数据
    for (MovieModel *model in self.dataArray)
    {
        [db insertIntoTableName:filename model:model];
    }

    [_tableView reloadData];
    [_collection reloadData]; //这里必须要刷新一下  要不然 就会出问题！


}


-(void)rightClicked
{
    static NSInteger i = 0;
    i++;
    
    if (i%2 == 0)
    {
        self.navigationItem.rightBarButtonItem.image = [UIImage imageNamed:@"btn_nav_collection.png"] ;
        NSLog(@"现在显示tableView");
        
        [self.view bringSubviewToFront:_tableView];
        
    }else
    {
        self.navigationItem.rightBarButtonItem.image = [UIImage imageNamed:@"btn_nav_list.png"];
        
         NSLog(@"现在显示不是TableView");
        
        [self.view bringSubviewToFront:_collection];
    }
}

-(void)createtableView
{
    self.tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;

    
    
    //布局类 控制每一个CELL 的样式 这里边叫Item
    UICollectionViewFlowLayout * flow = [[UICollectionViewFlowLayout alloc] init];
    
    //改变每个Item的大小
    flow.itemSize = CGSizeMake(100, 180);
    
    //中间的空格 特别丑  改变上下行之间的距离 （默认是10）
    flow.minimumLineSpacing = 10;
    
    CGFloat num = (self.view.frame.size.width-300)/4;
    
    //左右的两个最小距离
    flow.minimumInteritemSpacing = num;
    
    //    //滑动方向
    //    flow.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    //距离屏幕 上 左 下 右 的距离
    flow.sectionInset = UIEdgeInsetsMake(10, num, 10,num);
    
    _collection = [ [UICollectionView alloc] initWithFrame:[UIScreen mainScreen].bounds collectionViewLayout:flow ] ;
    
    _collection.delegate = self;
    _collection.dataSource = self;
    _collection.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_collection];
    
    
    [_collection registerClass:[MovieCollectionViewCell class] forCellWithReuseIdentifier:@"CELL"  ];
    
    
        [self.view addSubview:self.tableView];
    
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
    MovieTableViewCell *cell =[tableView dequeueReusableCellWithIdentifier: @"CELL"];
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    MovieModel *model = self.dataArray[indexPath.row];
    
    [cell setModel:model];
    
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSLog(@"你点击了第%ld",(long)indexPath.row );
    
    moviedetailViewController *vc = [[moviedetailViewController alloc] init];
    vc.title = @"影片详情";
    vc.index = indexPath.row;
    
    [vc setModel:self.dataArray[indexPath.row]];
    [self.navigationController pushViewController:vc animated:NO];
}



- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.title = @"电影";
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"bg_nav.png"] forBarMetrics:UIBarMetricsDefault];
}



-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    
  return  self.dataArray.count;
}


-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    //没有本身携带的空间 就是本身空白的  一般都是自定义cell
    MovieCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CELL" forIndexPath:indexPath ];
    
    
    [cell setModel:self.dataArray[indexPath.row]];
    
    //cell.backgroundColor = [UIColor redColor];
    
    return cell;
    
    
}


-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"你点击了第%ld",(long)indexPath.row );
    
    moviedetailViewController *vc = [[moviedetailViewController alloc] init];
    vc.title = @"影片详情";
    vc.index = indexPath.row;
    
    [vc setModel:self.dataArray[indexPath.row]];
    [self.navigationController pushViewController:vc animated:NO];

}

////每一个 Item的大小
//-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
//{
//    
//    //return  CGSizeMake(90,130);
//  return   CGSizeMake(100, 200);
//}




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
