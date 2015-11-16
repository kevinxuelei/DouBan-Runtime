//
//  ActivityModelevent1.m
//  WJL-Watercress
//
//  Created by 王剑亮 on 15/9/30.
//  Copyright (c) 2015年 wangjianliang. All rights reserved.
//

#import "ActivityModelevent1.h"

@implementation ActivityModelevent1


//编码 配合归档工具
-(void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:self.image forKey:@"image"];

    [aCoder encodeObject:self.adapt_url forKey:@"adapt_url"];

    [aCoder encodeObject:self.loc_name forKey:@"loc_name"];
    [aCoder encodeObject:self.alt forKey:@"alt"];
    [aCoder encodeObject:self.category forKey:@"category"];
    [aCoder encodeObject:self.id forKey:@"id"];
    [aCoder encodeObject:self.title forKey:@"title"];
    [aCoder encodeObject:self.wisher_count forKey:@"wisher_count"];
    [aCoder encodeObject:self.has_ticket forKey:@"has_ticket"];
    [aCoder encodeObject:self.content forKey:@"content"];


     [aCoder encodeObject:self.can_invite forKey:@"can_invite"];
    [aCoder encodeObject:self.album forKey:@"album"];
    [aCoder encodeObject:self.participant_count forKey:@"participant_count"];
    [aCoder encodeObject:self.image_hlarge forKey:@"image_hlarge"];
    [aCoder encodeObject:self.begin_time forKey:@"begin_time"];
    [aCoder encodeObject:self.geo forKey:@"geo"];
    [aCoder encodeObject:self.image_lmobile forKey:@"image_lmobile"];
    [aCoder encodeObject:self.category_name forKey:@"category_name"];
    [aCoder encodeObject:self.loc_id forKey:@"loc_id"];
    [aCoder encodeObject:self.end_time forKey:@"end_time"];
    [aCoder encodeObject:self.address forKey:@"address"];
    [aCoder encodeObject:self.subcategory_name forKey:@"subcategory_name"];

    

}

//反编码 （反序列化） 配合解档工具
-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self) {
        
        //把编码的数据反编码 回到本身的属性上

        self.image = [aDecoder decodeObjectForKey:@"image"];
       self.adapt_url = [aDecoder decodeObjectForKey:@"adapt_url"];

        
       self.loc_name = [aDecoder decodeObjectForKey:@"loc_name"];
       self.alt = [aDecoder decodeObjectForKey:@"alt"];

        self.id = [aDecoder decodeObjectForKey:@"id"];
        self.category = [aDecoder decodeObjectForKey:@"category"];
        self.title = [aDecoder decodeObjectForKey:@"title"];
        
        self.wisher_count = [aDecoder decodeObjectForKey:@"wisher_count"];
        self.has_ticket = [aDecoder decodeObjectForKey:@"has_ticket"];
        self.content = [aDecoder decodeObjectForKey:@"content"];
        

       self.can_invite = [aDecoder decodeObjectForKey:@"can_invite"];

        self.album = [aDecoder decodeObjectForKey:@"album"];

        self.participant_count =  [aDecoder decodeObjectForKey:@"participant_count"];
       self.participant_count = [aDecoder decodeObjectForKey:@"participant_count"];
       self.image_hlarge = [aDecoder decodeObjectForKey:@"image_hlarge"];
       self.begin_time = [aDecoder decodeObjectForKey:@"begin_time"];
       self.geo = [aDecoder decodeObjectForKey:@"geo"];
       self.image_lmobile = [aDecoder decodeObjectForKey:@"image_lmobile"];
       self.category_name = [aDecoder decodeObjectForKey:@"category_name"];


        self.loc_id = [aDecoder decodeObjectForKey:@"loc_id"];
       self.end_time = [aDecoder decodeObjectForKey:@"end_time"];
       self.address = [aDecoder decodeObjectForKey:@"address"];
       self.subcategory_name = [aDecoder decodeObjectForKey:@"subcategory_name"];
        
        

    }
    
    return self;
}

-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    NSLog(@"%@",key);
    
}
@end
