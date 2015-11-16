//
//  MyPlist.h
//  AdressBook
//
//  Created by 王剑亮 on 15/9/22.
//  Copyright (c) 2015年 wangjianliang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AdressonBookModel.h"
@interface MyPlist : NSObject

-(NSMutableArray *)ReadMyPlist:(NSString *)str;

-(void)WriteMyPlist:(NSMutableArray * )array WriteToPlistName:(NSString *)str;

@end
