//
//  moviedetailViewController.m
//  WJL-Watercress
//
//  Created by 王剑亮 on 15/10/4.
//  Copyright (c) 2015年 wangjianliang. All rights reserved.
//

#import "moviedetailViewController.h"
#import "loginViewController.h"
#import "URLTools.h"
#import "moviedetailModel.h"
#import "CollectionTools.h"
#import "CollectionViewController.h"
#import "MyPlist.h"
#import "UIImageView+WebCache.h"
#import "DataBasehandle.h"


@interface moviedetailViewController ()
{
    NSMutableDictionary *_maindic;
    UIScrollView * _scrollview;
    moviedetailModel  *detailmodel;
}

//title：电影名字
//rating_count: 评论人数

//：图片
@property (nonatomic, strong) UIImageView *posterView;
//评分
@property (nonatomic, strong) UILabel *ratingLabel;
//上映时间
@property (nonatomic, strong) UILabel *release_dateLabel;
//时间
@property (nonatomic, strong) UILabel *runtimeLabel;
//分类
@property (nonatomic, strong) UILabel *genresLabel;
//：国家
@property (nonatomic, strong) UILabel *countryLabel;

@property (nonatomic, strong) UILabel *actors;
//制作人信息
@property (nonatomic, strong) UILabel *actorsLabel;

@property (nonatomic, strong) UILabel *plot_simple;
//电影情节
@property (nonatomic, strong) UILabel *plot_simpleLabel;
@end

@implementation moviedetailViewController

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
        
        //：图片
        self.posterView = [[UIImageView alloc] init];
        [self.view addSubview:self.posterView];
        
        //评分
        self.ratingLabel = [[UILabel alloc] init];
        [self.view addSubview:self.ratingLabel];
        
        //上映时间
        self.release_dateLabel = [[UILabel alloc] init];
        [self.view addSubview:self.release_dateLabel];
        
        //时间
        self.runtimeLabel = [[UILabel alloc] init];
        [self.view addSubview:self.runtimeLabel];
        
        //分类
        self.genresLabel = [[UILabel alloc] init];
        [self.view addSubview:self.genresLabel];
        
        //国家
        self.countryLabel = [[UILabel alloc] init];
        [self.view addSubview:self.countryLabel];
        
        //制作人
        self.actors = [[UILabel alloc] init];
        [self.view addSubview:self.actors];
        
        //制作人信息
        self.actorsLabel = [[UILabel alloc] init];
        [self.view addSubview:self.actorsLabel];
        
        //电影情节
        self.plot_simple = [[UILabel alloc] init];
        [self.view addSubview:self.plot_simple];
        
        //电影情节
        self.plot_simpleLabel = [[UILabel alloc] init];
        [self.view addSubview:self.plot_simpleLabel];
        
        //：图片
        self.posterView.frame = CGRectMake(10, 10, 100, 150);
        //self.posterView.backgroundColor = [UIColor redColor];
        //评分
        self.ratingLabel.frame = CGRectMake(CGRectGetMaxX(self.posterView.frame)+10, CGRectGetMinY(self.posterView.frame), self.view.frame.size.width - 130, 20);
        //上映时间
        self.release_dateLabel.frame = CGRectMake(CGRectGetMaxX(self.posterView.frame) + 10, CGRectGetMaxY(self.ratingLabel.frame) + 10, CGRectGetWidth(self.ratingLabel.frame), 20);
        
        //时间
        self.runtimeLabel.frame = CGRectMake(CGRectGetMinX(self.ratingLabel.frame), CGRectGetMaxY(self.release_dateLabel.frame) + 10, CGRectGetWidth(self.release_dateLabel.frame), 20);
        
        //分类
        self.genresLabel.frame = CGRectMake(CGRectGetMinX(self.ratingLabel.frame), CGRectGetMaxY(self.runtimeLabel.frame) + 10, CGRectGetWidth(self.ratingLabel.frame), 20);
        
        //国家
        self.countryLabel.frame = CGRectMake(CGRectGetMinX(self.ratingLabel.frame), CGRectGetMaxY(self.genresLabel.frame) + 10, CGRectGetWidth(self.ratingLabel.frame), 20);
        
        //制作人
        self.actors.frame = CGRectMake(10, CGRectGetMaxY(self.posterView.frame) + 10, self.view.frame.size.width - 20, 40);
        self.actors.text = @"制作人";
        
        //制作人信息
        self.actorsLabel.frame = CGRectMake(CGRectGetMinX(self.actors.frame), CGRectGetMaxY(self.actors.frame) + 10, self.view.frame.size.width - 20, 40);

        
        //电影情节
        self.plot_simple.frame = CGRectMake(10, CGRectGetMaxY(self.actorsLabel.frame) + 10, self.view.frame.size.width - 20, 40);
        self.plot_simple.text = @"电影情节";
        
        //电影情节
        self.plot_simpleLabel.frame = CGRectMake(10, CGRectGetMaxY(self.plot_simple.frame) + 10, self.view.frame.size.width - 20, 40);
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
   
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
        NSString *filename = [NSString stringWithFormat:@"%@movie.plist",[MyPlist readCurrentusername]];
        
        BOOL isok = NO;
        //先那个解档 之后在归档
        NSMutableArray *arr ;
        arr = [CollectionTools UnArchive:filename];
        if (arr == nil)
        {
            NSMutableArray *arr1 = [NSMutableArray array];
            
            [arr1 addObject:self.model];
            [CollectionTools Archive:filename id:arr1];
            
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"收藏成功" delegate:self cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
            [alertView show];
        }else
        {
            for (MovieModel *model1 in arr) {
                
                if ([self.model.movieName isEqualToString:model1.movieName]) {
                    isok = YES;
                }
            }
            
            if (isok == YES) {
                UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"收藏失败 已经收藏！" delegate:self cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
                [alertView show];
            }
            else
            {
                [arr addObject:self.model];
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


-(void)setModel:(MovieModel *)model
{
    
    
    _maindic = [[NSMutableDictionary alloc] init];
    __block moviedetailViewController *vc = self;
    [URLTools PostdataURL:[NSString stringWithFormat:@"http://project.lanou3g.com/teacher/yihuiyun/lanouproject/searchmovie.php?movieId=%ld",(long)[model.movieId integerValue]]
     
              datastring:[NSString stringWithFormat:@"%ld",(long)[model.movieId integerValue]  ] block:^(id object) {
                  
                  _maindic = object;
                  NSLog(@"%@",_maindic);
                  //网络解析之后 就要解析出来模型
                  [vc dataToModel];
                  
              }];
    

    
    _model = model;
}


-(void)dataToModel
{
    NSMutableDictionary *arraydic = [_maindic objectForKey:@"result"];
    detailmodel = [[moviedetailModel alloc] init];
    for (NSString *key in arraydic)
    {
        [detailmodel setValue:[arraydic objectForKey:key] forKey:key];
    }
    
    [self setmassage:detailmodel];


}

-(void)setmassage:(moviedetailModel *)model
{
    
    
    
    //设置影片详情
    self.ratingLabel.text = [NSString stringWithFormat:@"评分：%@ （%@评论）", model.rating, model.rating_count];
    self.release_dateLabel.text = model.release_date;
    self.runtimeLabel.text = model.runtime;
    self.genresLabel.text = model.genres;
    self.countryLabel.text = model.country;
    
    self.actorsLabel.text = model.actors;
    self.actorsLabel.numberOfLines = 0;
    [self.actorsLabel sizeToFit];
    
    self.plot_simpleLabel.text = model.plot_simple;
    //这两个必须要写一个 否则文字不显示
    self.plot_simpleLabel.numberOfLines = 0;
    [self.plot_simpleLabel sizeToFit];
    
    [self.posterView sd_setImageWithURL:[NSURL URLWithString:model.poster] ];
    
    NSInteger heightNum = [self stringHeightWithString:self.plot_simpleLabel.text fontSize:18 contentSize:CGSizeMake(self.view.frame.size.width - 20, 10000)];
    
    _scrollview.contentSize = CGSizeMake(self.view.frame.size.width, self.plot_simpleLabel.frame.origin.y + heightNum);
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
