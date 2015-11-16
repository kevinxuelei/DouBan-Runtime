//
//  ActivityModelevent1.h
//  WJL-Watercress
//
//  Created by 王剑亮 on 15/9/30.
//  Copyright (c) 2015年 wangjianliang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ActivityModelevent1 : NSObject<NSCoding>



//events里边的第一个数组
@property (nonatomic, copy) NSString *image;
@property (nonatomic, copy) NSString *adapt_url;
@property (nonatomic, copy) NSString *ownername;


//第一个数组里边其余的字典
@property (nonatomic, copy) NSString *loc_name;
@property (nonatomic, copy) NSString *alt;
@property (nonatomic, copy) NSString *id;
@property (nonatomic, copy) NSString *category;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *wisher_count;
@property (nonatomic, copy) NSString *has_ticket;
@property (nonatomic, copy) NSString *content;

//"loc_name": "北京",
//"alt": "http://www.douban.com/event/21185304/",
//"id": "21185304",
//"category": "exhibition",
//"title": "罗马与巴洛克艺术",
//"wisher_count": 1975,
//"has_ticket": false,
//"content": "展期：2014/4/30 - 2015/2/28（展期以此为准）


@property (nonatomic, copy) NSString *can_invite;
@property (nonatomic, copy) NSString *album;
@property (nonatomic, copy) NSString *participant_count;
@property (nonatomic, copy) NSString *image_hlarge;

@property (nonatomic, copy) NSString *begin_time;
@property (nonatomic, copy) NSString *geo;
@property (nonatomic, copy) NSString *image_lmobile;
@property (nonatomic, copy) NSString *category_name;
@property (nonatomic, copy) NSString *loc_id;
@property (nonatomic, copy) NSString *end_time;
@property (nonatomic, copy) NSString *address;
@property (nonatomic, copy) NSString *subcategory_name;

//"can_invite": "no",
//"album": "127782312",
//"participant_count": 1645,
//"image_hlarge": "http://img3.douban.com/view/event_poster/hlarge/public/365aa3c50b5ba01.jpg",
//"photos": [],
//"begin_time": "2014-07-22 09:00:00",
//"geo": "39.905148 116.401711",
//"image_lmobile": "http://img3.douban.com/view/event_poster/lmobile/public/10f53a2ad8b38c5.jpg",
//"category_name": "展览",
//"loc_id": "108288",
//"end_time": "2014-10-16 17:00:00",
//"address": "北京 东城区 东长安街16号中国国家博物馆"

@end
