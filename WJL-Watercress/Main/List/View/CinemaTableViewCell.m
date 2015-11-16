//
//  CinemaTableViewCell.m
//  WJL-Watercress
//
//  Created by 王剑亮 on 15/9/29.
//  Copyright (c) 2015年 wangjianliang. All rights reserved.
//

#import "CinemaTableViewCell.h"

@interface CinemaTableViewCell ()

@property (nonatomic, copy) UIImageView *imageView1 ;

@property (nonatomic, copy) UILabel *nameLable ;
@property (nonatomic, copy) UILabel *adressLable ;
@property (nonatomic, copy) UILabel *phoneLable ;

@end

@implementation CinemaTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        _imageView1 = [[UIImageView alloc] init];
        _imageView1.image = [UIImage imageNamed:@"bg_eventlistcell.png"];
        //这里拿到的Width 永远是320！！！！！！！！！！！！！！！！！！！！！！！
        [self.contentView addSubview:_imageView1];
        
        _nameLable = [[UILabel alloc] init];
        _adressLable = [[UILabel alloc] init];
        _phoneLable = [[UILabel alloc] init];
        
        [self.imageView1 addSubview:_nameLable];
        [self.imageView1 addSubview:_adressLable];
        [self.imageView1 addSubview:_phoneLable];
    }
    
    return self;
}

//视图的变化 自适应Cell 高度的时候用 改变frame 自定义CELL 只能在这里初始化frame!!!
-(void)layoutSubviews
{
    [super layoutSubviews];
    
    _imageView1.frame = CGRectMake(10, 10, self.frame.size.width-20, 140);
    
    _nameLable.frame = CGRectMake(10,0,_imageView1.frame.size.width-10,40);
    _nameLable.font = [UIFont systemFontOfSize:24];
    
    _adressLable.frame = CGRectMake(10, 50,_imageView1.frame.size.width-20, 40);
    _adressLable.numberOfLines = 0;
    [_adressLable sizeToFit];
    
    _phoneLable.frame = CGRectMake(10,100,_imageView1.frame.size.width-10,40);

    
}


-(void)setModeltwo:(CinemaModel *)Model
{
    _nameLable.text = Model.cinemaName;

    
    _adressLable.text = Model.address;
    _adressLable.numberOfLines = 0;
    [_adressLable sizeToFit];
    
    _phoneLable.text = Model.telephone;
    _phoneLable.numberOfLines = 0;
    [_phoneLable sizeToFit];

}

//- (void)awakeFromNib {
//    // Initialization code
//}
//
//- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
//    [super setSelected:selected animated:animated];
//
//    // Configure the view for the selected state
//}

@end
