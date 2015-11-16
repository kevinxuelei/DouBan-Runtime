//
//  MyPlist.m
//  AdressBook
//
//  Created by 王剑亮 on 15/9/22.
//  Copyright (c) 2015年 wangjianliang. All rights reserved.
//

#import "MyPlist.h"

@implementation MyPlist


-(instancetype)init
{
    self = [super init];
    if (self) {
        
        
    }
    return self;
}

//读取用户名密码的数组
+(NSMutableArray *)readUsernameArray
{

    NSString *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    NSString *pathStr = [path stringByAppendingPathComponent:[NSString stringWithFormat:@"/userpassword.txt"]];
    
    NSMutableArray *array = [NSMutableArray arrayWithContentsOfFile:pathStr];
    return array;
}

//写入新的！ 用户名和密码  相当于没有覆盖文件！
+(void )writeUsername:(NSString *)username  password:(NSString *)password
{
    // key : 为了标记当前的UESRname
    //value : 当前用户名的Key
    
    NSDictionary *dic = @{username:password};
    NSString *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    NSString *pathStr = [path stringByAppendingPathComponent:[NSString stringWithFormat:@"/userpassword.txt"]];
    NSLog(@"%@",pathStr);
    
    //首先 读出来数组
    NSMutableArray *array = [self readUsernameArray];
    
    //如果为空 建立添加 写入 这是第一次
    if(array == nil)
    {
        NSMutableArray *array1 = [NSMutableArray array ];
        [array1 addObject:@{@"CueerntUserName":@""}];
        [array1 addObject:dic];
        [array1 writeToFile:pathStr atomically:YES];
    }else //如果不为空 添加写入
    {
        [array addObject:dic];
        [array writeToFile:pathStr atomically:YES];
    }
    
    
}

//数组写进文件中
+(void )writeArrayToUserpassword:(NSMutableArray *)array  {
    NSString *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    NSString *pathStr = [path stringByAppendingPathComponent:[NSString stringWithFormat:@"/userpassword.txt"]];
    
        [array writeToFile:pathStr atomically:YES];
}

//读取当前的用户名字

+(NSString *)readCurrentusername
{
    NSMutableArray *arr = [MyPlist readUsernameArray];
    

        NSMutableDictionary *usernamedic = arr[0];
    
    return [usernamedic allValues][0];
}

@end
