//
//  ActivityNextViewController.m
//  WJL-Watercress
//
//  Created by 王剑亮 on 15/9/29.
//  Copyright (c) 2015年 wangjianliang. All rights reserved.
//

#import "ActivityNextViewController.h"
#import "JSONKit.h"
#import "loginViewController.h"
#import "URLTools.h"
#import"UIImageView+WebCache.h"
#import "CollectionTools.h"
#import "MyPlist.h"
@interface ActivityNextViewController ()
{
        UIScrollView * _scrollview;
}
/** 活动标题 */
@property (nonatomic, strong) UILabel *titleLabel;
/** 开始时间 */
@property (nonatomic, strong) UILabel *begin_timeLabel;
/** 结束时间 */
@property (nonatomic, strong) UILabel *end_timeLabel;
/** 活动举办方 */
@property (nonatomic, strong) UILabel *nameLabel;
/** 地址 */
@property (nonatomic, strong) UILabel *addressLabel;
/** 活动类型 */
@property (nonatomic, strong) UILabel *category_nameLabel;
/** 活动图像(先显示占位图像) */
@property (nonatomic, strong) UIImageView *movieImageView;

@property (nonatomic, strong) UILabel *contentLabel;
@end

@implementation ActivityNextViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        _scrollview = [[UIScrollView alloc] initWithFrame:CGRectMake(0,64, self.view.frame.size.width, self.view.frame.size.height-64)];
        _scrollview.backgroundColor = [UIColor whiteColor];
        _scrollview.showsHorizontalScrollIndicator = NO;
        _scrollview.showsVerticalScrollIndicator = YES;
        _scrollview.pagingEnabled = YES;
        self.view = _scrollview;

        /** 活动标题 */
        
        self.titleLabel = [[UILabel alloc] init];
        
        [self.view addSubview:self.titleLabel];
        
        /** 活动图像(先显示占位图像) */
        
        self.movieImageView = [[UIImageView alloc] init];
        
        [self.view addSubview:self.movieImageView];
        

        /** 开始时间 */

        self.begin_timeLabel = [[UILabel alloc] init];
        
        [self.view addSubview:self.begin_timeLabel];
        
        /** 结束时间 */
        
        self.end_timeLabel = [[UILabel alloc] init];
        
        [self.view addSubview:self.end_timeLabel];
        
        /** 活动举办方 */
        
        self.nameLabel = [[UILabel alloc] init];
        
        [self.view addSubview:self.nameLabel];
        
        /** 活动类型 */
        
        self.category_nameLabel = [[UILabel alloc] init];
        
        [self.view addSubview:self.category_nameLabel];
        
        /** 地址 */
        
        self.addressLabel = [[UILabel alloc] init];
        
        [self.view addSubview:self.addressLabel];
        
        /** 活动介绍 */
        
        self.contentLabel = [[UILabel alloc] init];
        
        [self.view addSubview:self.contentLabel];
        
        
        /** 活动标题 */
        
        self.titleLabel.frame = CGRectMake(10, 10, self.view.frame.size.width - 20, 30);
        
        /** 活动图像(先显示占位图像) */
        
        self.movieImageView.frame = CGRectMake(10, CGRectGetMaxY(self.titleLabel.frame) + 10, 100, 150);
        
        
        
        UIImageView *imageTime = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon_date_blue"]];
        
        [self.view addSubview:imageTime];
        
        imageTime.frame = CGRectMake(CGRectGetMaxX(self.movieImageView.frame) + 10, CGRectGetMinY(self.movieImageView.frame), 20, 20);
        
        /** 开始时间 */
        
        self.begin_timeLabel.frame = CGRectMake(CGRectGetMaxX(imageTime.frame) + 10, CGRectGetMinY(imageTime.frame), 105, 20);
        self.begin_timeLabel.font = [UIFont systemFontOfSize:15];
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.begin_timeLabel.frame), CGRectGetMinY(self.begin_timeLabel.frame), 20, 20)];
        
        [self.view addSubview:label];
        
        label.text = @"--";
        label.font = [UIFont systemFontOfSize:15];
        
        /** 结束时间 */
        
        self.end_timeLabel.frame = CGRectMake(CGRectGetMaxX(label.frame)-10, CGRectGetMinY(self.begin_timeLabel.frame), 120, 20);
                self.end_timeLabel.font = [UIFont systemFontOfSize:15];
        
        
        UIImageView *imageName = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon_sponsor_blue"]];
        
        [self.view addSubview:imageName];
        
        imageName.frame = CGRectMake(CGRectGetMaxX(self.movieImageView.frame) + 10, CGRectGetMaxY(imageTime.frame) + 10, 20, 20);
        
        /** 活动举办方 */
        
        self.nameLabel.frame = CGRectMake(CGRectGetMinX(self.begin_timeLabel.frame) , CGRectGetMaxY(self.begin_timeLabel.frame) +10, self.view.frame.size.width - 155, 20);
        
        
        
        
        
        UIImageView *imageAddress = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon_catalog_blue"]];
        
        [self.view addSubview:imageAddress];
        
        imageAddress.frame = CGRectMake(CGRectGetMinX(imageName.frame), CGRectGetMaxY(imageName.frame) + 10, 20, 20);
        
        /** 活动类型 */
        
        self.category_nameLabel.frame = CGRectMake(CGRectGetMinX(self.nameLabel.frame) , CGRectGetMaxY(self.nameLabel.frame) +10, self.nameLabel.frame.size.width, 20);
        
        
        
        UIImageView *imageType = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon_spot_blue"]];
        
        [self.view addSubview:imageType];
        
        imageType.frame = CGRectMake(CGRectGetMinX(imageAddress.frame), CGRectGetMaxY(imageAddress.frame) + 10, 20, 20);
        
        /** 地址 */
        
        self.addressLabel.frame = CGRectMake(CGRectGetMinX(self.category_nameLabel.frame), CGRectGetMaxY(self.category_nameLabel.frame) + 10,self.view.frame.size.width - CGRectGetMaxX(imageType.frame)-10, 20);

        
        
        UILabel *content = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMinX(self. movieImageView.frame), CGRectGetMaxY(self.movieImageView.frame) + 10, self.view.frame.size.width - 20, 20)];
        
        [self.view addSubview:content];
        
        content.text = @"活动介绍";
        
        /** 活动介绍 */
        
        self.contentLabel.frame = CGRectMake(CGRectGetMinX(content.frame), CGRectGetMaxY(content.frame) + 10, CGRectGetWidth(content.frame), 50);
        

        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

        self.navigationItem.title = @"活动";
    
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"btn_nav_share.png"] style:UIBarButtonItemStylePlain target:self action:@selector(rightClicked)];
    
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"btn_nav_back.png"] style:UIBarButtonItemStylePlain target:self action:@selector(leftClicked)];
    
    

    
}

-(void)rightClicked
{
    
    //如果当前用户名 为空那么说明没有注册 这时候弹出登陆界面
    if ([[MyPlist readCurrentusername] isEqualToString:@""]  || ([MyPlist readCurrentusername] == nil) )
    {
        UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        loginViewController *loginvc = [storyBoard instantiateViewControllerWithIdentifier:@"two"];
        UINavigationController *nc = [[UINavigationController alloc] initWithRootViewController:loginvc];
        [self presentViewController:nc animated:YES completion:nil];
    }else//否则 将是分享
    {
        NSString *filename = [NSString stringWithFormat:@"%@activitr.plist",[MyPlist readCurrentusername]];
        
        BOOL isok = NO;
        //先那个解档 之后在归档
        NSMutableArray *arr ;
        arr = [CollectionTools UnArchive:filename];
        if (arr == nil)
        {
            NSMutableArray *arr1 = [NSMutableArray array];
            
            [arr1 addObject:self.Model];
            [CollectionTools Archive:filename id:arr1];
            
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"收藏成功" delegate:self cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
            [alertView show];
        }else
        {
            for (ActivityModelevent1 *model1 in arr) {
                
                if ([self.Model.title isEqualToString:model1.title]) {
                    isok = YES;
                }
            }
            
            if (isok == YES) {
                UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"收藏失败 已经收藏！" delegate:self cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
                [alertView show];
            }
            else
            {
                [arr addObject:self.Model];
                [CollectionTools Archive:filename id:arr];
                UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"收藏成功" delegate:self cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
                [alertView show];
            }
            
            
        }
        
    
    }
    
    

 




    
    
}

-(void)leftClicked{

    self.navigationItem.rightBarButtonItem = nil;
    self.navigationItem.leftBarButtonItem = nil;
    [self.navigationController popViewControllerAnimated:NO];
  

}


-(void)setModel:(ActivityModelevent1 *)Model
{

    //在这里弄 活动详情
    self.titleLabel.text = Model.title;
    self.begin_timeLabel.text = [Model.begin_time substringFromIndex:5];
    self.end_timeLabel.text = [Model.end_time substringFromIndex:5];
    //Model.ownername = Model.ownerdic.name;
    self.nameLabel.text = Model.ownername;
    
    self.addressLabel.text = Model.address;
    self.addressLabel.numberOfLines = 0;
    [self.addressLabel sizeToFit];
    
    self.category_nameLabel.text = [NSString stringWithFormat:@"类型：%@", Model.category_name];
    

    
    // 缓存非常重要 有了缓存之后非常好下载之后不会重复下载！ KVO监听模型属性 之后去刷新tableview 显然这里也不会刷新tableview 只是当KVO 写的时候去
    [self.movieImageView sd_setImageWithURL:[NSURL URLWithString:Model.image] ];

    
    self.contentLabel.text = Model.content;
    self.contentLabel.numberOfLines = 0;
    [self.contentLabel sizeToFit];
    
    NSInteger heightNum = [self stringHeightWithString:self.contentLabel.text fontSize:18 contentSize:CGSizeMake(self.view.frame.size.width - 20, 10000)];
   _scrollview.contentSize = CGSizeMake(self.view.frame.size.width, self.contentLabel.frame.origin.y + heightNum
);
    
    
    _Model = Model;
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



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
