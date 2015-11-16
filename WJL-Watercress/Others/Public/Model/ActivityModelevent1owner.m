//
//  ActivityModelevent1owner.m
//  WJL-Watercress
//
//  Created by 王剑亮 on 15/9/30.
//  Copyright (c) 2015年 wangjianliang. All rights reserved.
//

#import "ActivityModelevent1owner.h"

@implementation ActivityModelevent1owner


//编码 配合归档工具
-(void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeObject:self.avatar forKey:@"avatar"];
//     NSLog(@"%@",self.uid.description);
    [aCoder encodeObject:self.uid forKey:@"uid"];
    [aCoder encodeObject:self.alt forKey:@"alt"];
    [aCoder encodeObject:self.type forKey:@"type"];
    [aCoder encodeObject:self.id forKey:@"id"];
    [aCoder encodeObject:self.large_avatar forKey:@"large_avatar"];
}
//反编码 （反序列化） 配合解档工具
-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self) {
        
        //把编码的数据反编码 回到本身的属性上
        self.name = [aDecoder decodeObjectForKey:@"name"];
        self.avatar = [aDecoder decodeObjectForKey:@"avatar"];

        self.uid = [aDecoder decodeObjectForKey:@"uid"];
        
        self.alt = [aDecoder decodeObjectForKey:@"alt"];
        self.type = [aDecoder decodeObjectForKey:@"type"];
        self.id = [aDecoder decodeObjectForKey:@"id"];
        self.large_avatar = [aDecoder decodeObjectForKey:@"large_avatar"];
      }
    
    return self;
}
-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    NSLog(@"%@",key);
    
}

@end
