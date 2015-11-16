//
//  MyPlist.h
//  AdressBook
//
//  Created by 王剑亮 on 15/9/22.
//  Copyright (c) 2015年 wangjianliang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyPlist : NSObject


+(NSMutableArray *)readUsernameArray;
+(void )writeUsername:(NSString *)username  password:(NSString *)password;
+(void )writeArrayToUserpassword:(NSMutableArray *)array ;

+(NSString *)readCurrentusername;
@end
