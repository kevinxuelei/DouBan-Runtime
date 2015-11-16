//
//  Cinema2TableViewCell.m
//  WJL-Watercress
//
//  Created by 王剑亮 on 15/10/5.
//  Copyright (c) 2015年 wangjianliang. All rights reserved.
//

#import "Cinema2TableViewCell.h"
#import "URLTools.h"
#import "UIImageView+WebCache.h"
@interface Cinema2TableViewCell  ()
@property (nonatomic, strong) UILabel *movieName;
@property (nonatomic, strong) UIImageView *movieImage;
@end

@implementation Cinema2TableViewCell

- (void)awakeFromNib {
    // Initialization code
}


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.movieName = [[UILabel alloc] init];
        [self.contentView addSubview:self.movieName];
        
        self.movieImage = [[UIImageView alloc] init];
        [self.contentView addSubview:self.movieImage];
    }
    return self;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    UIImageView *image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg_eventlistcell"]];
    [self.contentView addSubview:image];
    image.frame = CGRectMake(10, 10, self.frame.size.width - 20, 190);
    [self.contentView sendSubviewToBack:image];
    
    self.movieImage.frame = CGRectMake(CGRectGetMinX(image.frame) + 10, CGRectGetMinY(image.frame) + 10, 100, image.frame.size.height - 20);
    
    
    self.movieName.frame = CGRectMake(CGRectGetMaxX(self.movieImage.frame) + 10, CGRectGetMinY(self.movieImage.frame), CGRectGetWidth(image.frame) - 130, image.frame.size.height - 20);
    
}

-(void)setModel:(Cinema2Model *)model
{
    self.movieName.text = model.movieName;
//    [URLTools GetdataURL:model.pic_url block:^(id object) {
//        
//        self.movieImage.image = [UIImage imageWithData:object];
//    }];
    
   [self.movieImage sd_setImageWithURL:[NSURL URLWithString:model.pic_url] ];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
