//
//  moviedetailViewController.h
//  WJL-Watercress
//
//  Created by 王剑亮 on 15/10/4.
//  Copyright (c) 2015年 wangjianliang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MovieModel.h"
@interface moviedetailViewController : UIViewController

@property (nonatomic, assign) NSInteger index;
@property (nonatomic, assign) MovieModel *model;
@end
