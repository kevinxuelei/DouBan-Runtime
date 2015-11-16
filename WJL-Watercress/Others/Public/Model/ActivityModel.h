//
//  ActivityModel.h
//  WJL-Watercress
//
//  Created by 王剑亮 on 15/9/30.
//  Copyright (c) 2015年 wangjianliang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ActivityModelevent1.h"
@interface ActivityModel : NSObject

@property (nonatomic, copy) NSNumber *count;
@property (nonatomic, copy) NSNumber *start;
@property (nonatomic, copy) NSNumber *total;
@property (nonatomic, copy) NSMutableDictionary *events;
@property (nonatomic, retain) ActivityModelevent1 *events1;
//@property (nonatomic, retain) ActivityModelevent2 *events2;


@end
