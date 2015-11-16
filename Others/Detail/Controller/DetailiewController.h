//
//  DetailiewController.h
//  AdressBook
//
//  Created by 王剑亮 on 15/9/22.
//  Copyright (c) 2015年 wangjianliang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AdressonBookModel.h"
@interface DetailiewController : UIViewController

-(void)setModel:(AdressonBookModel *)model;


@property (nonatomic,copy) void (^block)(AdressonBookModel *model);


@end
