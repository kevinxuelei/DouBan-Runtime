//
//  AdressonBookModel.h
//  AdressBook
//
//  Created by 王剑亮 on 15/9/22.
//  Copyright (c) 2015年 wangjianliang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AdressonBookModel : UIViewController
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *age;
@property (nonatomic, copy) NSString *sex;
@property (nonatomic, copy) NSString *phone;
@property (nonatomic, copy) NSString *Content;
@property (nonatomic, strong) NSData *image;

- (id)initWithName:(NSString *)name
               age:(NSString *)age
               sex:(NSString *)sex
             phone:(NSString *)phone
           content:(NSString *)content
             image:(NSData *)image;



@end
