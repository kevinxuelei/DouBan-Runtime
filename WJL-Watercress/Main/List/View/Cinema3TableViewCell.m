//
//  Cinema3TableViewCell.m
//  WJL-Watercress
//
//  Created by 王剑亮 on 15/10/5.
//  Copyright (c) 2015年 wangjianliang. All rights reserved.
//

#import "Cinema3TableViewCell.h"
//#import <UIKit/UIKit.h>
@interface Cinema3TableViewCell ()

//播放厅
@property (nonatomic, strong) UILabel *hallLabel;
//票价
@property (nonatomic, strong) UILabel *priceLabel;
//播放时间
@property (nonatomic, strong) UILabel *timeLabel;
//类型
@property (nonatomic, strong) UILabel *typeLabel;
//语言
@property (nonatomic, strong) UILabel *languageLabel;


@end


@implementation Cinema3TableViewCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //播放厅
        self.hallLabel = [[UILabel alloc] init];
        [self.contentView addSubview:self.hallLabel];
        //票价
        self.priceLabel = [[UILabel alloc] init];
        [self.contentView addSubview:self.priceLabel];
        //播放时间
        self.timeLabel = [[UILabel alloc] init];
        [self.contentView addSubview:self.timeLabel];
        //类型
        self.typeLabel = [[UILabel alloc] init];
        [self.contentView addSubview:self.typeLabel];
        //语言
        self.languageLabel = [[UILabel alloc] init];
        [self.contentView addSubview:self.languageLabel];
    }
    return self;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    UIImageView *image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg_eventlistcell"]];
    [self.contentView addSubview:image];
    image.frame = CGRectMake(10, 10, self.frame.size.width - 20, 110);
    [self.contentView sendSubviewToBack:image];
    
    //播放厅
    self.hallLabel.frame = CGRectMake(10, 10, self.frame.size.width - 20, 20);
    
    //票价
    self.priceLabel.frame = CGRectMake(10, CGRectGetMaxY(self.hallLabel.frame), self.frame.size.width - 20, 20);
    
    //播放时间
    self.timeLabel.frame = CGRectMake(10, CGRectGetMaxY(self.priceLabel.frame), self.frame.size.width - 20, 20);
    
    //类型
    self.typeLabel.frame = CGRectMake(10, CGRectGetMaxY(self.timeLabel.frame), self.frame.size.width - 20, 20);
    
    //语言
    self.languageLabel.frame = CGRectMake(10, CGRectGetMaxY(self.typeLabel.frame), self.frame.size.width - 20, 20);
    
}

- (void)binModel:(Cinema3Model *)model
{
    //播放厅
    self.hallLabel.text = [NSString stringWithFormat:@"播放厅:    %@", model.hall];
    
    //票价
    self.priceLabel.text = [NSString stringWithFormat:@"票价:     %@", model.price];
    
    //播放时间
    self.timeLabel.text = [NSString stringWithFormat:@"播放时间:   %@", model.time];
    
    //类型
    self.typeLabel.text = [NSString stringWithFormat:@"类型:    %@", model.type];
    
    //语言
    self.languageLabel.text = [NSString stringWithFormat:@"语言:   %@", model.language];
    
}



- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
