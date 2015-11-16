//
//  DetailiewController.m
//  AdressBook
//
//  Created by 王剑亮 on 15/9/22.
//  Copyright (c) 2015年 wangjianliang. All rights reserved.
//

#import "DetailiewController.h"
#import "LtView.h"
@interface DetailiewController ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate,UIActionSheetDelegate>
@property (nonatomic, strong) LtView *nameView;
@property (nonatomic, strong) LtView *sexView;
@property (nonatomic, strong) LtView *ageView;
@property (nonatomic, strong) LtView *phoneView;
@property (nonatomic, strong) UIImageView *imageview;
@property (nonatomic, strong) UITextView *contentView;
@property (nonatomic, strong) UIButton *imageButton;
@property (nonatomic, strong) UIImage *ContentImage;



@end

@implementation DetailiewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBar.translucent = NO;
    [self createview];
    
}

-(void)createview
{
    CGFloat y = 0;
    
    self.nameView = [[LtView alloc] initWithFrame:CGRectMake(10, 110+y, self.view.frame.size.width-20, 30)];
    self.sexView = [[LtView alloc] initWithFrame:CGRectMake(10, 150+y, self.view.frame.size.width-20, 30)];
    self.ageView = [[LtView alloc] initWithFrame:CGRectMake(10, 190+y, self.view.frame.size.width-20, 30)];
    self.phoneView = [[LtView alloc] initWithFrame:CGRectMake(10, 230+y, self.view.frame.size.width-20, 30)];
    self.imageview = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0+y, 107, 107)];
    
    self.contentView = [[UITextView alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(self.phoneView.frame) + 10, self.view.frame.size.width - 20, 150)];
    
    self.imageButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.imageButton.frame = CGRectMake(0, 0+y, 107, 107);
    [self.imageButton setBackgroundImage:[UIImage imageNamed:@"1"] forState:UIControlStateNormal ];
    [self.imageButton setTitle:@"选取图片" forState:UIControlStateNormal];
     [self.imageButton addTarget:self action:@selector(imagebuttonclicked:) forControlEvents:UIControlEventTouchUpInside];
    
    self.contentView.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.contentView];
    
    self.nameView.name.text = @"姓名:";
    self.ageView.name.text = @"年龄:";
    self.sexView.name.text = @"性别:";
    self.phoneView.name.text = @"电话号:";
    
    [self.view addSubview:self.nameView];
    [self.view addSubview:self.sexView];
    [self.view addSubview:self.ageView];
    [self.view addSubview:self.phoneView];
    [self.view addSubview:self.imageButton];
    
    
    UIButton *button=[UIButton buttonWithType:UIButtonTypeCustom] ;
    button.frame= CGRectMake(200, 0, 100, 40);
    button.tag=1;
    button.layer.cornerRadius = 3.0f;
    [button addTarget:self action:@selector(ButtonCilck:) forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"确定结束" forState:UIControlStateNormal];
    button.backgroundColor=[UIColor redColor];
    [self.view addSubview:button];
    
    //必须有一个默认图片
    _ContentImage = [UIImage imageNamed:@"1"];

}

-(void)imagebuttonclicked:(UIButton *)btn
{
    NSLog(@"点击了图片");
    UIActionSheet *action = [[UIActionSheet alloc] initWithTitle:@"选取照片" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"相机" otherButtonTitles:@"相册", nil];
    [action showInView:self.view];

}

//是想 获取相册照片 还是拍照 自己选择
-(void)setImagePickerController:(UIImagePickerControllerSourceType )source
{
    UIImagePickerController *imagepicker = [[UIImagePickerController alloc] init];
    imagepicker.sourceType = source;
    imagepicker.delegate = self;
    
    
    [imagepicker setEditing:YES];
    imagepicker.allowsEditing = YES;
    
    //模态推出视图
    
    [self presentViewController:imagepicker animated:YES completion:nil];
}

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{

    switch (buttonIndex) {
        case 0:
            
            [self setImagePickerController:UIImagePickerControllerSourceTypeCamera];
            break;
        case 1:
                        [self setImagePickerController:UIImagePickerControllerSourceTypePhotoLibrary];
            break;
        default:
            break;
    }

}

//选完图片之后做出的处理
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
//    NSLog(@"%@",info);
//    NSLog(@"%@",picker);
    
    //    不需要编辑 UIImagePickerControllerOriginalImage
    //    如果需要编辑 需要获取UIImagePickerControllerEditedImage
    
    UIImage *image = [info objectForKey:@"UIImagePickerControllerEditedImage" ];
    _ContentImage = image;
    [self.imageButton setBackgroundImage:image forState:UIControlStateNormal];
    
    [picker dismissViewControllerAnimated:YES completion:nil];
    
    AdressonBookModel * model = [[AdressonBookModel alloc] init];
    model.name = self.nameView.textflied.text;
    model.age = self.ageView.textflied.text;
    model.sex = self.sexView.textflied.text;
    model.phone = self.phoneView.textflied.text;
    model.Content = self.contentView.text;
    
    UIImage *image1 = _ContentImage;
    NSData *data;
    if (UIImagePNGRepresentation(image1) == nil) {
        
        data = UIImageJPEGRepresentation(image1, 1);
        
    } else {
        
        data = UIImagePNGRepresentation(image1);
    }
    model.image = data;
    _block(model);

}

-(void)ButtonCilck:(UIButton *)btn
{
    NSLog(@"按钮点击了");
    AdressonBookModel * model = [[AdressonBookModel alloc] init];
    model.name = self.nameView.textflied.text;
    model.age = self.ageView.textflied.text;
    model.sex = self.sexView.textflied.text;
    model.phone = self.phoneView.textflied.text;
    model.Content = self.contentView.text;
    
    UIImage *image = _ContentImage;
    NSData *data;
    if (UIImagePNGRepresentation(image) == nil) {
        
        data = UIImageJPEGRepresentation(image, 1);
        
    } else {
        
        data = UIImagePNGRepresentation(image);
    }
    model.image = data;
    
    _block(model);
    
    [self.navigationController popViewControllerAnimated:YES];
}


-(void)setModel:(AdressonBookModel *)model
{
    self.nameView.textflied.text = model.name;
    self.sexView.textflied.text = model.sex;
    self.ageView.textflied.text = model.age;
    self.phoneView.textflied.text = model.phone;
    self.contentView.text = model.Content;
    _ContentImage = [UIImage imageWithData:model.image];
    [self.imageButton setBackgroundImage:[UIImage imageWithData:model.image] forState:UIControlStateNormal];
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{

    [self.view endEditing:YES];
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
