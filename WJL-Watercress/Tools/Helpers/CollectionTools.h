//
//  CollectionTools.h
//  WJL-Watercress
//
//  Created by 王剑亮 on 15/10/6.
//  Copyright (c) 2015年 wangjianliang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CollectionTools : NSObject
+(void)Archive:(NSString *)filename id:(id)id1;
+(id)UnArchive:(NSString *)filename;
@end
