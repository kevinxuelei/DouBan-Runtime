//
//  ActivityTableViewCell.m
//  WJL-Watercress
//
//  Created by 王剑亮 on 15/9/29.
//  Copyright (c) 2015年 wangjianliang. All rights reserved.
//

#import "ActivityTableViewCell.h"
#import "URLTools.h"
#import "JSONKit.h"
#import "UIImageView+WebCache.h"
@interface ActivityTableViewCell ()

@property (nonatomic, copy) UIImageView *imageView1 ;
@property (nonatomic, copy) UIImageView *upimageView ;
@property (nonatomic, copy) UIImageView *timeimageView ;
@property (nonatomic, copy) UIImageView *adressimageView ;
@property (nonatomic, copy) UIImageView *typeimageView ;

@property (nonatomic, copy) UILabel *typeLable ;
@property (nonatomic, copy) UILabel *interestLable ;
@property (nonatomic, copy) UILabel *joinLable ;


//数据的显示空间

@property (nonatomic, copy) UILabel *titleLable;  //标题
@property (nonatomic, copy) UILabel *timeLable;   //时间
@property (nonatomic, copy) UILabel *adressLable;   //时间
@property (nonatomic, copy) UILabel *category_nameLable;//活动
@property (nonatomic, copy) UILabel *participant_countLable;//参加人数
@property (nonatomic, copy) UILabel *wisher_countLable;  //感兴趣
@property (nonatomic, copy) UIImageView *imagepic;   //活动图像
@property (nonatomic, copy) UILabel *nameBoosLable;//活动举办方

@end

@implementation ActivityTableViewCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        _imageView1 = [[UIImageView alloc] init];
        _imageView1.image = [UIImage imageNamed:@"bg_eventlistcell.png"];
        //这里拿到的Width 永远是320！！！！！！！！！！！！！！！！！！！！！！！
        [self.contentView addSubview:_imageView1];
        
        _upimageView = [[UIImageView alloc] init];
        _upimageView.image = [UIImage imageNamed:@"bg_share_large.png"];
        _timeimageView = [[UIImageView alloc] init];
        _timeimageView.image = [UIImage imageNamed:@"icon_date_blue.png"];
        _adressimageView = [[UIImageView alloc] init];
        _adressimageView.image = [UIImage imageNamed:@"icon_spot_blue.png"];
        _typeimageView = [[UIImageView alloc] init];
        _typeimageView.image = [UIImage imageNamed:@"icon_catalog_blue.png"];
        
        [_imageView1 addSubview:_upimageView];
        [_upimageView addSubview:_timeimageView];
        [_upimageView addSubview:_adressimageView];
        [_upimageView addSubview:_typeimageView];
        
        _typeLable = [[UILabel alloc] init];
        _typeLable.text = @"类型:";
        _typeLable.font = [UIFont systemFontOfSize:15];
        
        _interestLable = [[UILabel alloc] init];
        _interestLable.text = @"感兴趣:";
        _interestLable.font = [UIFont systemFontOfSize:15];
        
        _joinLable = [[UILabel alloc] init];
        _joinLable.text = @"参加:";
        _joinLable.font = [UIFont systemFontOfSize:15];
        
        [_upimageView addSubview:_typeLable];
        [_upimageView addSubview:_interestLable];
        [_upimageView addSubview:_joinLable];
        
        [self createModelDisplay];
    }
    
    return self;
}


-(void)createModelDisplay
{

    _titleLable = [[UILabel alloc] init];
    _timeLable = [[UILabel alloc] init];
    _adressLable  = [[UILabel alloc] init];
    _category_nameLable = [[UILabel alloc] init];
    _participant_countLable = [[UILabel alloc] init];
    _wisher_countLable = [[UILabel alloc] init];
    _imagepic = [[UIImageView alloc] init];
    _nameBoosLable = [[UILabel alloc] init];
    


    [self.imageView1 addSubview:_titleLable];
    [self.upimageView addSubview:_timeLable];
    [self.upimageView addSubview:_adressLable];
    [self.upimageView addSubview:_category_nameLable];
    [self.upimageView addSubview:_participant_countLable];
    [self.upimageView addSubview:_wisher_countLable];
    [self.upimageView addSubview:_imagepic];
    [self.upimageView addSubview:_nameBoosLable];
}

//视图的变化 自适应Cell 高度的时候用 改变frame 自定义CELL 只能在这里初始化frame!!!
-(void)layoutSubviews
{
    [super layoutSubviews];
    
    _imageView1.frame = CGRectMake(10, 10, self.frame.size.width-20, 140);
    _upimageView.frame = CGRectMake(5, 25, self.frame.size.width-30, 110);
    _timeimageView.frame = CGRectMake(10, 5, 16,16);
    _adressimageView.frame = CGRectMake(10, 25,16,16);
    _typeimageView.frame = CGRectMake(10, 45,16, 16);
    
    _typeLable.frame = CGRectMake(26, 45,64, 16);
    _interestLable.frame = CGRectMake(10, 90,64, 16);
    _joinLable.frame = CGRectMake(120, 90,64, 16);
    
    
    CGFloat x = 130;
    _titleLable.frame = CGRectMake(10, 0,self.frame.size.width-x,30);
    _titleLable.lineBreakMode = NSLineBreakByTruncatingTail;
    _titleLable.textAlignment = NSTextAlignmentLeft;

        _timeLable.frame = CGRectMake(28,3,self.frame.size.width-x,20);
        _timeLable.font = [UIFont systemFontOfSize:15];
    
    _adressLable.frame = CGRectMake(28,23,self.frame.size.width-x,20);
    _adressLable.font = [UIFont systemFontOfSize:15];
    
    _category_nameLable.frame = CGRectMake(74, 45-2,self.frame.size.width-x-64,20);
    _category_nameLable.font = [UIFont systemFontOfSize:15];
    
    _participant_countLable.frame = CGRectMake(74-5, 90-2,self.frame.size.width-x-64,20);
    _participant_countLable.font = [UIFont systemFontOfSize:15];
    _participant_countLable.textColor = [UIColor redColor];
    
    _wisher_countLable.frame = CGRectMake(184,90-2,self.frame.size.width-x-64,20);
    _wisher_countLable.font = [UIFont systemFontOfSize:15];
    _wisher_countLable.textColor = [UIColor redColor];
    
    
    _imagepic.frame = CGRectMake(self.frame.size.width -110, 5, 70, 100);
    //_imagepic.backgroundColor = [UIColor redColor];
    
}

-(void)setModel:(ActivityModelevent1 *)Model
{

        //处理那些资源的加载
        _titleLable.text =  Model.title;
        
        NSString *starttime = [Model.begin_time substringFromIndex:5];
        NSString *endtime = [Model.end_time substringFromIndex:5];
        _timeLable.text = [[starttime stringByAppendingString:@" -- "]stringByAppendingString:endtime];
        
        _adressLable.text = Model.address;
        _category_nameLable.text = Model.category_name;
        _participant_countLable.text = [NSString stringWithFormat:@"%d",[Model.participant_count intValue]];
        _wisher_countLable.text = [NSString stringWithFormat:@"%d",[Model.wisher_count intValue]];
        
        
//        __block UIImage *image;
//        __block ActivityTableViewCell *cell = self;
//        //从网络上获取数据 之后解析一下 放在model上 添加到数组上
//        [URLTools GetdataURL:Model.image
//                       block:^(id object) {
//                           
//                           image = [UIImage imageWithData:object];
//                           //NSLog(@"%@",data);
//                           //NSLog(@"%@",image);
//                           [cell setimage:image];
//                       }];
    
        [_imagepic sd_setImageWithURL:[NSURL URLWithString:Model.image] ];

}



//-(void)setimage:(UIImage *)image
//{
//    _imagepic.image = image;
//
//}

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
