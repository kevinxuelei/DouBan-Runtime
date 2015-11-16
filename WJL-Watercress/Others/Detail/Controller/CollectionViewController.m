//
//  CollectionViewController.m
//  WJL-Watercress
//
//  Created by 王剑亮 on 15/10/6.
//  Copyright (c) 2015年 wangjianliang. All rights reserved.
//

#import "CollectionViewController.h"
#import "CollectionTools.h"
#import "ActivityModelevent1.h"
#import "ActivityNextViewController.h"
#import "MovieModel.h"
#import "moviedetailViewController.h"
#import "MyPlist.h"
@interface CollectionViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    BOOL _editStyle;
}
@property (nonatomic, strong ) NSMutableArray *dataArray;
@property (nonatomic, strong ) UITableView *tableView;


@end

@implementation CollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    self.dataArray = [NSMutableArray array];
    self.tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.view addSubview:self.tableView];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"CELL"];
    
    


    if ([self.collectionname isEqualToString:@"activi"]) {
        
                            NSString *filename = [NSString stringWithFormat:@"%@activitr.plist",[MyPlist readCurrentusername]];
          self.dataArray = [CollectionTools UnArchive:filename];
    }else
    if ([self.collectionname isEqualToString:@"movie"])
    {
                            NSString *filename = [NSString stringWithFormat:@"%@movie.plist",[MyPlist readCurrentusername]];
         self.dataArray = [CollectionTools UnArchive:filename];
    }


    
    //设置编辑状态为可以编辑做准备
    
    [self.tableView setEditing:YES];
    _editStyle = UITableViewCellEditingStyleDelete;
    [self.tableView setEditing:NO];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CELL" forIndexPath:indexPath];
    


    if ([self.collectionname isEqualToString:@"activi"])
    {
        ActivityModelevent1 *model = self.dataArray[indexPath.row];
        cell.textLabel.text = model.title;
    }else
    if ([self.collectionname isEqualToString:@"movie"])
    {
        
       MovieModel *model = self.dataArray[indexPath.row];
       cell.textLabel.text = model.movieName;
    }

   
    return cell;

}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    NSMutableArray *arr ;
    
    if ([self.collectionname isEqualToString:@"activi"]) {
        
        NSString *filename = [NSString stringWithFormat:@"%@activitr.plist",[MyPlist readCurrentusername]];
        
          arr = [CollectionTools UnArchive:filename];
        
        ActivityNextViewController *vc = [[ActivityNextViewController alloc] init];
        [vc setModel:arr[indexPath.row]];
        [self.navigationController pushViewController:vc animated:NO];
    }else
    if ([self.collectionname isEqualToString:@"movie"])
    {
        
         NSString *filename = [NSString stringWithFormat:@"%@movie.plist",[MyPlist readCurrentusername]];
         arr = [CollectionTools UnArchive:filename];
        
        moviedetailViewController *vc = [[moviedetailViewController alloc] init];
        [vc setModel:arr[indexPath.row]];
        [self.navigationController pushViewController:vc animated:NO];
    }

    


}



// 第三步：设置哪个cell 可以编辑
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 都可以编辑
    return YES;
}

// 第四步：在进入编辑之前，通过这个方法 返回编辑的状态（插入还是删除）
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return _editStyle;
}

// 第五步：真正的执行编辑的事情
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 处理删除或插入的过程
    // 判断 是要做插入 还是 要做 删除
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        // 在编辑的时候，一定要先处理数据源 然后再处理view
        [self.dataArray removeObjectAtIndex:indexPath.row];
        
        
        if ([self.collectionname isEqualToString:@"activi"]) {
                    NSString *filename = [NSString stringWithFormat:@"%@activitr.plist",[MyPlist readCurrentusername]];
                    [CollectionTools Archive:filename id:self.dataArray];
        }else
        if ([self.collectionname isEqualToString:@"movie"])
        {
                    NSString *filename = [NSString stringWithFormat:@"%@movie.plist",[MyPlist readCurrentusername]];
                    [CollectionTools Archive:filename id:self.dataArray];
        }

        
        // tableView 删除一个cell的方法 第一个参数代表 删除哪个分区喜下的cell, 第二个参数 代表 删除的动画
        [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationLeft];
    }

}

//是否允许移动 ！！
-(BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return YES;
}

//是否可以跨区  返回目的地
//可以限制跨区域移动
-(NSIndexPath *)tableView:(UITableView *)tableView targetIndexPathForMoveFromRowAtIndexPath:(NSIndexPath *)sourceIndexPath toProposedIndexPath:(NSIndexPath *)proposedDestinationIndexPath
{
    
    //如果是一个组 就让移动到 目的地  如果不是则不动！
    if ( sourceIndexPath.section == proposedDestinationIndexPath.section) {
        return proposedDestinationIndexPath;
    }else
    {
        return sourceIndexPath;
    }
    
}


//在编辑的状态下 随便移动  处理移动结果 松手了才会走
//写了这个方法才会出现右边的三道杠
//处理数据的移动!!!!
-(void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
{
    NSMutableArray *arr = self.dataArray[sourceIndexPath.section];
    
    NSString *str = arr[sourceIndexPath.row];
    
    [arr removeObjectAtIndex:sourceIndexPath.row];
    
    NSMutableArray *arr1 = self.dataArray[destinationIndexPath.section];
    
    [arr1 insertObject:str atIndex:destinationIndexPath.row];
    
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
