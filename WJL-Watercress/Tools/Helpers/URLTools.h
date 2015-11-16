//
//  URLTools.h
//  WJL-Watercress
//
//  Created by 王剑亮 on 15/9/30.
//  Copyright (c) 2015年 wangjianliang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface URLTools : NSObject
{
    id object;

}

+(void)GetdataURL:(NSString *)strURL block:(void (^)(id object))Blockdata;

+(void)PostdataURL:(NSString *)strURL datastring:(NSString *)parmaStr block:(void (^)(id object))Blockdata;
@end
