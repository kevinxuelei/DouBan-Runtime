//
//  CinemaModel.h
//  WJL-Watercress
//
//  Created by 王剑亮 on 15/10/3.
//  Copyright (c) 2015年 wangjianliang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CinemaModel : NSObject


//id 影院id!
//cinemaName 影院名称!
//address 影院地址!
//telephone 影院电话!
//trafficRoutes 影院乘⻋车路线!
//"id":"141",!
//"cityName":"北京",!
//"cinemaName":"北京博纳影城朝阳⻔门旗舰店",! "address":"北京市朝阳区三丰北⾥里2号楼悠唐⽣生活⼲⼴广场B1层(朝阳⻔门钱柜对⾯面)",! "telephone":"010-59775660",!
//"latitude":"39.92223",!
//"longitude":"116.4388",! "trafficRoutes":"乘坐101电,109电,110,112电,420,750路公交在朝阳⻔门外站下
//⻋车,悠唐⽣生活⼲⼴广场地下⼀一层"!

@property (nonatomic, copy) NSString *id;
@property (nonatomic, copy) NSString *cinemaName;
@property (nonatomic, copy) NSString *address;
@property (nonatomic, copy) NSString *telephone;
@property (nonatomic, copy) NSString *trafficRoutes;
@property (nonatomic, copy) NSString *longitude;
@property (nonatomic, copy) NSString *latitude;
@property (nonatomic, copy) NSString *cityName;

@end
