//
//  MovieModel.h
//  WJL-Watercress
//
//  Created by 王剑亮 on 15/10/3.
//  Copyright (c) 2015年 wangjianliang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MovieModel : NSObject<NSCoding>

//! movieName:电影名!
//! pic_url:图⽚片 !
//! movieid:电影编号!

@property (nonatomic, copy) NSString *movieName;
@property (nonatomic, copy) NSString *pic_url;
@property (nonatomic, copy) NSString *movieId;


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
