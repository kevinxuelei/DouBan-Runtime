//
//  MovieTableViewCell.m
//  WJL-Watercress
//
//  Created by 王剑亮 on 15/9/29.
//  Copyright (c) 2015年 wangjianliang. All rights reserved.
//

#import "MovieTableViewCell.h"
#import "URLTools.h"
#import "UIImageView+WebCache.h"

@interface MovieTableViewCell ()

@property (nonatomic, copy) UIImageView *imageView1 ;
@property (nonatomic, copy) UIImageView *imageViewpic ;
@property (nonatomic, copy) UILabel *nameLable;


@end

@implementation MovieTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{

    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        _imageView1 = [[UIImageView alloc] init];
        _imageView1.image = [UIImage imageNamed:@"bg_eventlistcell.png"];
        //这里拿到的Width 永远是320！！！！！！！！！！！！！！！！！！！！！！！
        _nameLable = [[UILabel alloc] init];
        
        
        _imageViewpic = [[UIImageView alloc] init];
        [self.contentView addSubview:_imageView1];
        [self.imageView1 addSubview:_nameLable];
        [self.imageView1 addSubview:_imageViewpic];
    }
 
    return self;
}

//视图的变化 自适应Cell 高度的时候用 改变frame 自定义CELL 只能在这里初始化frame!!!
-(void)layoutSubviews
{
    [super layoutSubviews];
    
    _imageView1.frame = CGRectMake(10, 10, self.frame.size.width-20, 140);
    _nameLable.frame = CGRectMake(100, 40,  _imageView1.frame.size.width - 100 , 60);
    _nameLable.font = [UIFont systemFontOfSize:24];
    _nameLable.textAlignment =  NSTextAlignmentCenter;
    _nameLable.lineBreakMode = NSLineBreakByTruncatingMiddle;
    _imageViewpic.frame = CGRectMake(5, 5,90, 130);
    
    
}

-(void)setModel:(MovieModel *)Model
{
    _nameLable.text = Model.movieName;
    [_imageViewpic sd_setImageWithURL:[NSURL URLWithString:Model.pic_url] ];

}

@end
