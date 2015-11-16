//
//  ListTableViewCell.m
//  AdressBook
//
//  Created by 王剑亮 on 15/9/22.
//  Copyright (c) 2015年 wangjianliang. All rights reserved.
//

#import "ListTableViewCell.h"

@interface ListTableViewCell ()

@property (nonatomic, strong) UILabel *nameLable;
@property (nonatomic, strong) UILabel *ageLable;
@property (nonatomic, strong) UILabel *sexLable;
@property (nonatomic, strong) UILabel *phoneLable;
@property (nonatomic, strong) UILabel *contentLable;
@property (nonatomic, strong) UIImageView *headerimageView;


@end

@implementation ListTableViewCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        CGFloat x = 100;
        
        self.nameLable = [[UILabel alloc] initWithFrame:CGRectMake(10+x, 20, 100, 20)];
        self.ageLable = [[UILabel alloc] initWithFrame:CGRectMake(200, 20, 355, 20)];
        self.sexLable = [[UILabel alloc] initWithFrame:CGRectMake(10+x, 60, 100, 20)];
        self.phoneLable = [[UILabel alloc] initWithFrame:CGRectMake(200, 60, 355, 20)];
        self.contentLable = [[UILabel alloc] initWithFrame:CGRectMake(10, 100, self.frame.size.width-20, 20)];

        //这个需要转换一下
        self.headerimageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 90, 90)];
        
        [self.contentView addSubview:self.nameLable];
        [self.contentView addSubview:self.ageLable];
        [self.contentView addSubview:self.sexLable];
        [self.contentView addSubview:self.phoneLable];
        [self.contentView addSubview:self.contentLable];
        [self.contentView addSubview:self.headerimageView];
        
        CGFloat a = arc4random()%256/255.0;
        CGFloat b = arc4random()%256/255.0;
        CGFloat c = arc4random()%256/255.0;
        
        self.nameLable.textColor = [UIColor colorWithRed:a green:b blue:c  alpha:1];
        self.ageLable.textColor = [UIColor colorWithRed:a green:c blue:b  alpha:1];
        self.sexLable.textColor = [UIColor colorWithRed:b green:a blue:c  alpha:1];
        self.phoneLable.textColor = [UIColor colorWithRed:b green:c blue:a  alpha:1];
        self.contentLable.textColor = [UIColor colorWithRed:c green:b blue:a  alpha:1];
     
        
    }


    return self;
}


-(void) setModel:(AdressonBookModel *) model
{

    self.nameLable.text = model.name;
    self.ageLable.text = model.age;
    self.sexLable.text = model.sex;
    self.phoneLable.text = model.phone;
    self.contentLable.text = model.Content;
    self.headerimageView.image = [UIImage imageWithData:model.image];
    

}

- (CGFloat)stringHeightWithString:(NSString *)str fontSize:(CGFloat)fontSize contentSize:(CGSize)size
{
    //    第一个参数 代表最大的范围
    //    第二个参数 代表 是否考虑字体、字号
    //    第三个参数 代表使用什么字体、字号
    //    第四个参数 用不到 所以基本为nil
    CGRect stringRect = [str boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:fontSize]} context:nil];
    
    return stringRect.size.height;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    self.contentLable.numberOfLines = 0;
    [self.contentLable sizeToFit];
    self.contentLable.frame = CGRectMake(10, 100, self.frame.size.width-20, [self stringHeightWithString:self.contentLable.text fontSize:18 contentSize:CGSizeMake(self.frame.size.width-20, 10000)]);

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
