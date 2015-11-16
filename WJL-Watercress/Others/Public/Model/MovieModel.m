//
//  MovieModel.m
//  WJL-Watercress
//
//  Created by 王剑亮 on 15/10/3.
//  Copyright (c) 2015年 wangjianliang. All rights reserved.
//

#import "MovieModel.h"

@implementation MovieModel


//编码 配合归档工具
-(void)encodeWithCoder:(NSCoder *)aCoder
{
    
    [aCoder encodeObject:self.movieName forKey:@"movieName"];
    [aCoder encodeObject:self.pic_url forKey:@"pic_url"];
    [aCoder encodeObject:self.movieId forKey:@"movieId"];

}
//反编码 （反序列化） 配合解档工具
-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self) {
        
        //把编码的数据反编码 回到本身的属性上
        self.movieName = [aDecoder decodeObjectForKey:@"movieName"];
        self.pic_url = [aDecoder decodeObjectForKey:@"pic_url"];
        self.movieId =[aDecoder decodeObjectForKey:@"movieId"];
    }
    
    return self;
}



-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    NSLog(@"%@",key);
    
}

@end
