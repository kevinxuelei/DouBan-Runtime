//
//  Cinema2Model.h
//  WJL-Watercress
//
//  Created by 王剑亮 on 15/10/5.
//  Copyright (c) 2015年 wangjianliang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cinema2Model : NSObject
//电影名字
@property (nonatomic, copy) NSString *movieName;
//电影图片
@property (nonatomic, copy) NSString *pic_url;
//id
@property (nonatomic, copy) NSString *movieId;

@property (nonatomic, copy) NSMutableDictionary *broadcast;

@end
