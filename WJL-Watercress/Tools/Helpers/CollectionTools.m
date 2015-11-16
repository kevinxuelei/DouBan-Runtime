//
//  CollectionTools.m
//  WJL-Watercress
//
//  Created by 王剑亮 on 15/10/6.
//  Copyright (c) 2015年 wangjianliang. All rights reserved.
//

#import "CollectionTools.h"

@implementation CollectionTools


//Person *person = [[Person alloc] init];
//person.name = @"大腿";
//person.phone = @"1234567";
//NSString *path = [NSHomeDirectory() stringByAppendingPathComponent:@"/person.csc"];
////归档 并且写入文件
//[NSKeyedArchiver archiveRootObject:person toFile:path];
//
////解档
//Person *person1 = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
//
//NSLog(@"%@",person1);

+(void)Archive:(NSString *)filename id:(id)id1
{
    
    NSString *document = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    NSString *path = [document stringByAppendingPathComponent:[NSString stringWithFormat:@"/%@",filename]];
    NSLog(@"%@",path);
    
    //归档 并且写入文件
    [NSKeyedArchiver archiveRootObject:id1 toFile:path];
}


+(id)UnArchive:(NSString *)filename
{
        NSString *document = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    NSString *path = [document stringByAppendingPathComponent:[NSString stringWithFormat:@"/%@",filename]];
   id  id1 = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
   return id1;
}


@end
