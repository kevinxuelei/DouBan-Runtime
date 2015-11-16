//
//  UserViewController.m
//  WJL-Watercress
//
//  Created by 王剑亮 on 15/9/29.
//  Copyright (c) 2015年 wangjianliang. All rights reserved.
//

#import "UserViewController.h"
#import "loginViewController.h"
#import "CollectionTools.h"
#import "CollectionViewController.h"
#import "MyPlist.h"
@interface UserViewController ()<UITableViewDelegate,UITableViewDataSource,UIAlertViewDelegate>
@property (nonatomic, strong ) NSMutableArray *dataArray;

@property (nonatomic, strong ) UITableView *tableView;
@property (nonatomic, copy) NSMutableDictionary *dic;
@end

@implementation UserViewController

//页面即将弹出的时候
-(void)viewWillAppear:(BOOL)animated
{
    //没有当前用户名的时候 是登陆
    if ([[MyPlist readCurrentusername] isEqualToString:@""] || ([MyPlist readCurrentusername] == nil))
    {
        //给左边的按钮重写一下方法
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"登陆" style:UIBarButtonItemStylePlain target:self action:@selector(rightClicked)];
    }else
    {
        //给左边的按钮重写一下方法
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"注销" style:UIBarButtonItemStylePlain target:self action:@selector(rightClicked)];
    }

}

- (void)viewDidLoad {
    [super viewDidLoad];

    //初始化标题 和 背景图片
    self.navigationItem.title = @"我的";
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"bg_nav.png"] forBarMetrics:UIBarMetricsDefault];
    
    //生成UItableview
    [self createtbaleView];
    
    //初始化数组
    self.dataArray = [NSMutableArray arrayWithArray:@[@"我的活动",@"我的电影",@"清除缓存"]];
    
    
}


//生成tablecell
-(void)createtbaleView
{
    self.tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self.view addSubview:self.tableView];
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"CELL"];

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return  self.dataArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    //在CELL 重用池子里边 拿出来一个Cell 使用
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier: @"CELL"];
    
    cell.textLabel.text = self.dataArray[indexPath.row];

    return cell;
    
}

-(void)login
{
    // //开始加载登陆界面 那应该是一个ViewController 这个在MyStoryboard
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    loginViewController *loginvc = [storyBoard instantiateViewControllerWithIdentifier:@"two"];
    UINavigationController *nc = [[UINavigationController alloc] initWithRootViewController:loginvc];
    [self presentViewController:nc animated:YES completion:nil];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSLog(@"你点击了第%ld",(long)indexPath.row );
    

    
    
    if (indexPath.row == 0)
    {
        if ([[MyPlist readCurrentusername] isEqualToString:@""] || ([MyPlist readCurrentusername] == nil))
        {
  
            [self login];
        }else
        {
        CollectionViewController *vc = [[CollectionViewController alloc] init];
        vc.collectionname = @"activi";
        vc.title = @"我的活动";
        [self.navigationController pushViewController:vc animated:YES];
        }
    }else
    if (indexPath.row == 1)
    {
        if ([[MyPlist readCurrentusername] isEqualToString:@""] || ([MyPlist readCurrentusername] == nil))
        {
          [self login];
        }else
        {
        CollectionViewController *vc = [[CollectionViewController alloc] init];
        vc.title = @"我的电影";
        vc.collectionname = @"movie";
        [self.navigationController pushViewController:vc animated:YES];
        }
    }
    if (indexPath.row == 2)
    {
        
            if ([[MyPlist readCurrentusername] isEqualToString:@""] || ([MyPlist readCurrentusername] == nil))
            {
               [self login];

            }else
            {
                
                UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"确认清除缓存" delegate:self cancelButtonTitle:@"canle" otherButtonTitles:@"确定", nil];
                alertView.tag = 101;
                [alertView show];
            
            }
    }

    
}



-(void)rightClicked
{
    
    if ([[MyPlist readCurrentusername] isEqualToString:@""] || ([MyPlist readCurrentusername] == nil))
    {
        [self login];
    }else
    {
    
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"确认注销" delegate:self cancelButtonTitle:@"canle" otherButtonTitles:@"确定", nil];
        alertView.tag = 100;
        [alertView show];

    }

  //////////////////搞定！！！！！！！！！！！！！！！！！！！

}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (alertView.tag == 100)
    {
        if (buttonIndex == 1) {
            //这里把当前用户名字 清空！
            
            NSMutableArray *arr = [MyPlist readUsernameArray];
            NSMutableDictionary *usernamedic = arr[0];
            [usernamedic setObject:@"" forKey:@"CueerntUserName"];
            //标记好的数组 那个写入文件中
            [MyPlist writeArrayToUserpassword:arr];
            //给左边的按钮重写一下方法
            self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"登陆" style:UIBarButtonItemStylePlain target:self action:@selector(rightClicked)];
        }
    }else
    if (alertView.tag == 101) {
        
        
        if (buttonIndex == 1)//在这里边清除缓存
        {
            
            
        }

        
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
