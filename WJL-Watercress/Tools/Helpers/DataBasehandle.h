//
//  DataBasehandle.h
//  WJL-Watercress
//
//  Created by 王剑亮 on 15/10/8.
//  Copyright (c) 2015年 wangjianliang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataBasehandle : NSObject
+(DataBasehandle *) sharedDataBasehandle;

-(void)openDB;
-(void)closeDB;

/* 获取对象的所有属性和属性内容 */
- (NSDictionary *)getAllPropertiesAndVaulesModel:(id)model;

-(void)createtableName:(NSString *)name model:(id)model;

-(void)insertIntoTableName:(NSString *)name model:(id )model;

-(void)deleteFromTableName:(NSString *)name model:(id )model;

-(NSArray *)selectAllTableName:(NSString *)name Model:(id)model;

@end
