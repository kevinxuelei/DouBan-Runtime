//
//  loginViewController.m
//  WJL-Watercress
//
//  Created by 王剑亮 on 15/9/29.
//  Copyright (c) 2015年 wangjianliang. All rights reserved.
//

#import "loginViewController.h"
#import"registerViewController.h"
#import "MyPlist.h"
@interface loginViewController ()

@property (weak, nonatomic) IBOutlet UITextField *username;
@property (weak, nonatomic) IBOutlet UITextField *password;


@end

@implementation loginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.


    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(leftClicked)];
    
    self.title = @"用户登录";
    
}
- (IBAction)loginbutton:(UIButton *)sender {
  
    
   NSMutableArray *arr = [MyPlist readUsernameArray];
    
    //判断用户名和密码在不在数组中
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithDictionary:@{_username.text:_password.text}];
    
    //如果 数组中有字典 那么登陆成功！
    if ([arr containsObject:dic]) {
        
        NSMutableDictionary *usernamedic = arr[0];

        [usernamedic setObject:_username.text forKey:@"CueerntUserName"];
        //标记好的数组 那个写入文件中
        [MyPlist writeArrayToUserpassword:arr];
        
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"登陆成功" delegate:self cancelButtonTitle:nil otherButtonTitles:@"确认", nil];
        [alertView show];
        
    }else
    {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"用户名或密码不正确" delegate:self cancelButtonTitle:nil otherButtonTitles:@"确认", nil];
        [alertView show];
    }
    
    
}

- (IBAction)registerClicked:(UIButton *)sender {
    
    
    //这里跳转到注册界面 这里还应该是模态跳转 之后还在mystoryboard 中弄这个界面
    NSLog(@"你还要那个做出来注册界面");
    
    
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    registerViewController *regusterVC = [storyBoard instantiateViewControllerWithIdentifier:@"register"];

    regusterVC.myblock = ^(NSString *str1 , NSString *str2)
    {
        _username.text = str1;
        _password.text = str2;
    
    };
    
    [self.navigationController pushViewController:regusterVC animated:YES ];
    
}



-(void)leftClicked
{
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
    NSLog(@"返回了");
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
