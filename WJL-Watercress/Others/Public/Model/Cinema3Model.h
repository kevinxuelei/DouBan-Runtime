//
//  Cinema3Model.h
//  WJL-Watercress
//
//  Created by 王剑亮 on 15/10/5.
//  Copyright (c) 2015年 wangjianliang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cinema3Model : NSObject
//播放厅
@property (nonatomic, copy) NSString *hall;
//票价
@property (nonatomic, copy) NSString *price;
//播放时间
@property (nonatomic, copy) NSString *time;
//类型
@property (nonatomic, copy) NSString *type;
//语言
@property (nonatomic, copy) NSString *language;
@end
