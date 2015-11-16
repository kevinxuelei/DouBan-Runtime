//
//  ListViewController.m
//  AdressBook
//
//  Created by 王剑亮 on 15/9/22.
//  Copyright (c) 2015年 wangjianliang. All rights reserved.
//

#import "ListViewController.h"
#import "ListTableViewCell.h"
#import "AdressonBookModel.h"
#import "LtView.h"
#import "DetailiewController.h"
#import "MyPlist.h"

//写个Tableview
@interface ListViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    NSData *data;
    MyPlist *ToolPlist;
}
@property (nonatomic, strong ) NSMutableArray *dataArray;
@property (nonatomic, strong ) UITableView *tableView;
@property (nonatomic, copy) NSMutableDictionary *dic;


@end

@implementation ListViewController




- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.view addSubview:self.tableView];
    
    
    
    // 如果想设置Title或者左右两边的按钮，就使用navigationItem。
    // 如果想设置navigationController的样式，就是用self.navigationController.navigationBar
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(deleteAction:)];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertAction:)];
    
    
        NSMutableArray *array = [[NSMutableArray alloc] initWithObjects:@"胡凯dvcndjksbvjkdsbdhjsbchjdsbvcdhsjbvchdjsbcvhdsjvbdsghvcdghsvcdgshvcdhgsvcshjvbdsghv", @"吕世涛", @"🐒赛雷ewjfiewfjeijfioewjfieojfesjenveownviovnvnjvnenveuvnejvneuvnilveuivnvuis fnvbers uhvesiuvhewuihfuewhfueihfuiehfueiwhgeryugher", @"🐒塞雷同桌", @"摇滚驴", @"羊羊羊", @"易超", @"drregewgbfweyfgqywufuwqgfyuwagfyugygyfeugfeuyfgewygfegf李军用", @"姬国宾", @"任鹏杰", @"张茹", @"袁玉灵", @"文萱竹", @"温馨", @"任治源", @"王维斌", @"程登辉", @"任义春fbmjdfgbjdfgbdfjbgjdfgbfdhbfdhbdfhbhfdjbtjdtjhfhjdhb", @"魏义涛", @"鲍宇", @"董学雷", @"杨雅杰", @"杨蕾", @"潘龙", @"李颢玮", @"张振强", @"张书瑞", @"徐海丰", @"王安贺", @"李岩岩", @"杨东宝bdfbfdbfdbfdbfdbfdbfdbfdb", @"王剑亮", @"王丽珍", @"冯江", @"王傲青", @"李元喜", @"李祎", @"于继龙fdbfdbdfbfdbfdbfdbfdbfdb", @"栗鹏龙", @"陈媚", @"郑赛", @"李辉", @"包照日格吐", @"马文强dsvdsvdfvdfvdvdfvdfvdfvdfbvdfvdfbijhdbvhbdshvbdshvbsdhvbdshgvdsbcdshcbhcbsaiuhdasinaillhvcychusjerngvjscthdsvbgvbcedhstvbcdgsncejkstvnctjrsdcnvdjsrtb dhrstcdjs ntcdjs hvjdgs cntrdjs th fg fg sdgbdbfhtnrnhnfhbfhbfhbfhny t rhbrhbrhbrthbrtbrthbrbrbrtb6brthbrthyrhy6rbrt hrt rthbrybrbrbhtrth rthbrhbrbbrtrthrtbrth rt hrth rh rt rth grbrtgbrtehbryhtg rtg rthgbrthgrth grthgbrthgbrytgbfyhgbryhgbrhtgb hrgb yhrtgbrythgb ryhtghrtgbhrgbryhtgbyhtb rythbgb yrthbtyrhtb", nil];
    self.dataArray = [NSMutableArray array]; //初始化本地的数组 这个是存放模型的数组非常重要
    
    //初始化工具类
    ToolPlist = [[MyPlist alloc] init];
    NSMutableArray *plistarray = [ToolPlist ReadMyPlist:@"pListText.plist"];
    
//    NSLog(@"%@",plistarray);
    
    if ((plistarray == nil) || (plistarray.count == 0)) {
    
        //如果是空的初始化模型哈哈！
        for (int i = 0; i < array.count; i++) {
            
            UIImage *image = [UIImage imageNamed:@"1"];
            
            if (UIImagePNGRepresentation(image) == nil) {
                
                data = UIImageJPEGRepresentation(image, 1);
                
            } else {
                
                data = UIImagePNGRepresentation(image);
            }
            
            
            AdressonBookModel *model = [[AdressonBookModel alloc] initWithName:@"123" age:@"456" sex:@"男" phone:@"13718080238" content:array[i] image:data];
            
            [self.dataArray addObject:model];
        }
        
        
        //把模型数组写到Plist文件里边
        [ToolPlist WriteMyPlist:self.dataArray WriteToPlistName:@"pListText.plist"];
      
    } else//如果不是空的 那么读取文件到 数组里边
    {
        self.dataArray = plistarray;
    }
    


    //self.tableView.tableHeaderView  //今天测试 看一下效果
    //self.tableView.tableFooterView = [[UIView alloc] init];
    
    self.navigationController.navigationBar.translucent = NO;
    
    
    
}

-(void)deleteAction:(UIBarButtonItem *)bar
{
  
    
    [self.tableView setEditing:!self.tableView.isEditing animated:YES];
}

//返回那块可以编辑
-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

//编辑数据和页面的处理
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{

    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        //删除数据
        [self.dataArray removeObjectAtIndex:indexPath.row];
        
        //写数据到Plist文件里边
        [ToolPlist WriteMyPlist:self.dataArray WriteToPlistName:@"pListText.plist"];
        
        //刷新界面
        [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationLeft];
    }


}

-(void)insertAction:(UIBarButtonItem *)bar
{

    DetailiewController *vc = [[DetailiewController alloc] init];
    vc.view.backgroundColor = [UIColor whiteColor];
    
    //初始化block块 反向传值到这里执行
    vc.block = ^(AdressonBookModel *model)
    {
        //添加一个新的模型
        [self.dataArray addObject:model];
        //写数据到Plist文件里边
        [ToolPlist WriteMyPlist:self.dataArray WriteToPlistName:@"pListText.plist"];
        //刷新界面
        [self.tableView reloadData];
    };
    //建立一个新的模型
    AdressonBookModel *model = [[AdressonBookModel alloc] init];
    [vc setModel:model];

    //界面跳转
    [self.navigationController pushViewController:vc animated:YES];
}

- (CGFloat)stringHeightWithString:(NSString *)str fontSize:(CGFloat)fontSize contentSize:(CGSize)size
{
    //    第一个参数 代表最大的范围
    //    第二个参数 代表 是否考虑字体、字号
    //    第三个参数 代表使用什么字体、字号
    //    第四个参数 用不到 所以基本为nil
    CGRect stringRect = [str boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:fontSize]} context:nil];
    
    return stringRect.size.height;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
       AdressonBookModel *model = self.dataArray[indexPath.row];
    
    if (indexPath.row == self.dataArray.count-1)
    {
            return [self stringHeightWithString:model.Content fontSize:18 contentSize:CGSizeMake(self.view.frame.size.width-20, 10000) ]+ 164;
    }
    
    return [self stringHeightWithString:model.Content fontSize:18 contentSize:CGSizeMake(self.view.frame.size.width-20, 10000) ]+ 100;
//    return 200;
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
    ListTableViewCell *cell =[tableView dequeueReusableCellWithIdentifier: str];
    
    if(!cell)
    {
        //如果重用磁子里边 没有cell 放到cell 池子里边
        cell = [[ListTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:str];
        NSLog(@"cell");
        i++;
    }
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    AdressonBookModel *model = self.dataArray[indexPath.row];
    [cell setModel:model];
    
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //NSLog(@"你点击了第%ld",(long)indexPath.row );
    
    DetailiewController *vc = [[DetailiewController alloc] init];
    vc.view.backgroundColor = [UIColor whiteColor];
    NSMutableArray *plistarray = [ToolPlist ReadMyPlist:@"pListText.plist"];
    self.dataArray = plistarray;
    [vc setModel:self.dataArray[indexPath.row]];
    
    //block 第二个界面回传过来的
    vc.block = ^(AdressonBookModel *model)
    {
        //[self.dataArray setObject:model atIndexedSubscript:indexPath.row];
        //修改数据到 模型数组 更新一下修改的数据
        [self.dataArray replaceObjectAtIndex:indexPath.row withObject:model];
        //写数据到Plist文件里边
        [ToolPlist WriteMyPlist:self.dataArray WriteToPlistName:@"pListText.plist"];
        //刷新界面
        [self.tableView reloadData];
    };

   
    //界面跳转
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
