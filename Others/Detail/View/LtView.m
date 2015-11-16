//
//  LtView.m
//  AdressBook
//
//  Created by 王剑亮 on 15/9/22.
//  Copyright (c) 2015年 wangjianliang. All rights reserved.
//

#import "LtView.h"

@interface LtView ()



@end

@implementation LtView



-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
   
    if (self) {
        
        self.name = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 60, 30)];
        self.name.layer.borderWidth = 0.5;
        self.name.font = [UIFont systemFontOfSize:15];
        self.name.textAlignment = NSTextAlignmentLeft;
        
        [self addSubview:self.name];
        
        self.textflied = [[UITextField alloc] initWithFrame:CGRectMake(70, 0, self.frame.size.width-70, 30)];
        self.textflied.layer.borderWidth = 0.5;
        [self addSubview:self.textflied];
        
        

        
        
    }
    return self;
}







@end
