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


//记住plist文件只能存储基础的数据类型妈的 ！！！！！！！

-(NSMutableArray *)ReadMyPlist:(NSString *)str
{
    //@"pListText.plist"
    NSArray *documentArr = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentStr = documentArr[0];
    NSString *patchStr = [documentStr stringByAppendingPathComponent:str];
    NSLog(@"patchStr ====== %@",patchStr);
    NSMutableArray *array = [NSMutableArray arrayWithContentsOfFile:patchStr];
    
    NSMutableArray *array1 = [NSMutableArray array];
    for (NSMutableDictionary *dic in array) {
        
        AdressonBookModel * model = [[AdressonBookModel alloc] init];
        model.name = dic[@"name"];
        model.age = dic[@"age"];
        model.sex = dic[@"sex"];
        model.phone = dic[@"phone"];
        model.Content = dic[@"content"];
        model.image = dic[@"image"];

        [array1 addObject:model];
    }
    
    
    
    return array1;
}




-(void)WriteMyPlist:(NSMutableArray * )array WriteToPlistName:(NSString *)str
{
    
    NSArray *documentArr = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentStr = documentArr[0];
    NSString *patchStr = [documentStr stringByAppendingPathComponent:str];
    NSLog(@"patchStr ====== %@",patchStr);
    if (array == nil) {
        NSLog(@"数组为空 写进Plist文件里边");
        array = [NSMutableArray array];
       [array writeToFile:patchStr atomically:YES];//写进去 用数组相当于新建一个文件 没有新建 有更改
    }else
    {
         NSLog(@"数组直接写进Plist文件里边");
        NSMutableArray *arr = [NSMutableArray array];
        for (AdressonBookModel *model in array) {
          
            NSString *name = model.name;
            NSString *age = model.age;
            NSString *sex = model.sex;
            NSString *phone = model.phone;
            NSString *content = model.Content;
            NSData *image = model.image;
            NSData *data;
            

            if(image == nil)
            {
                //排除程序崩溃初始化一个默认图片
                UIImage *image1 = [UIImage imageNamed:@"1"];
                if (UIImagePNGRepresentation(image1) == nil) {
                    
                    data = UIImageJPEGRepresentation(image1, 1);
                    
                } else {
                    
                    data = UIImagePNGRepresentation(image1);
                }
                image = data;
            }
            
            NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithDictionary: @{@"name":name, @"age":age , @"sex":sex ,@"phone":phone, @"image":image,@"content":content}];
            [arr addObject:dic];
        }
        
//        NSLog(@"%@",arr);
        [arr writeToFile:patchStr atomically:YES];//写进去 用数组相当于新建
    }

}

//if (array == nil) {
//    array = [NSMutableArray array];
//    [array writeToFile:patchStr atomically:YES];//写进去 用数组相当于新建一个文件 没有新建 有更改
//}else
//{
//    
//    NSString *keyStr = [NSString stringWithFormat:@"%d",arc4random()%100];
//    NSString *valueStr = [NSString stringWithFormat:@"number:%d",arc4random()%200];
//    
//    NSMutableDictionary *dic =[NSMutableDictionary dictionaryWithObject:valueStr forKey:keyStr];
//    
//    [array addObject:dic];
//    
//    [array writeToFile:patchStr atomically:YES];//写进去 用数组相当于新建
//    
//}

@end
