//
//  moviedetailModel.h
//  WJL-Watercress
//
//  Created by 王剑亮 on 15/10/4.
//  Copyright (c) 2015年 wangjianliang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface moviedetailModel : NSObject

////plot_simple:简介!
////! title:电影名字!
////! genres:分类!
////! country:国家!
////! runtime:时间!
////! poster:图⽚片 ! 地址！！！！！！！
////! rating_count: 评论⼈人数!
////! rating:评分!
////! release_date:上映时间!
////! actors:制作⼈人信息!
@property (nonatomic, copy) NSString *plot_simple;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *genres;
@property (nonatomic, copy) NSString *country;
@property (nonatomic, copy) NSString *runtime;
@property (nonatomic, copy) NSString *poster;
@property (nonatomic, copy) NSString *rating;
@property (nonatomic, copy) NSString *rating_count;
@property (nonatomic, copy) NSString *release_date;
@property (nonatomic, copy) NSString *actors;


@end
