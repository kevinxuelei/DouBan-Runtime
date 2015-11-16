//
//  registerViewController.m
//  WJL-Watercress
//
//  Created by 王剑亮 on 15/9/29.
//  Copyright (c) 2015年 wangjianliang. All rights reserved.
//

#import "registerViewController.h"
#import "MyPlist.h"
#import "loginViewController.h"
@interface registerViewController ()<UIAlertViewDelegate>

@property (weak, nonatomic) IBOutlet UITextField *username;
@property (weak, nonatomic) IBOutlet UITextField *password;
@property (weak, nonatomic) IBOutlet UITextField *verifypassword;

@end

@implementation registerViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    self.title = @"注册";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"注册" style:UIBarButtonItemStylePlain target:self action:@selector(rightClicked)];
    
    
    
}

-(void)rightClicked
{

if ([_username.text isEqualToString:@""] || [_password.text isEqualToString:@""] ||[_verifypassword.text isEqualToString:@""])
  {
      UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"警告" message:@"用户名或密码为空,注册失败" delegate:self cancelButtonTitle:nil otherButtonTitles:@"确认", nil];
      [alertView show];
      
  }else
  {
      
      //如果用户名存在那么 用户名存在
      BOOL ishave = NO;
      for (NSMutableDictionary *dic in [MyPlist readUsernameArray]) {
          
          NSString *username = [dic allKeys][0];
          
          if ([username isEqualToString:_username.text]) {
              ishave = YES;
          }
      }
      
      if (ishave == YES) {
                  UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"用户名存在" delegate:self cancelButtonTitle:nil otherButtonTitles:@"确认", nil];
          [alertView show];
      }
      else
      {
          
          if ([_password.text isEqualToString:_verifypassword.text]) {
              UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"注册成功" delegate:self cancelButtonTitle:nil otherButtonTitles:@"确认", nil];
              [alertView show];
              alertView.tag = 100;
              //注册成功 把用户名和密码写进去
              [MyPlist writeUsername:_username.text password:_password.text];
              

              
              self.myblock(_username.text,_password.text);
              

              
              
              
          }else
          {
              UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"注册失败,确认密码不对" delegate:self cancelButtonTitle:nil otherButtonTitles:@"确认", nil];
              [alertView show];
          }
          
      }
  }
}


-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    
    if (alertView.tag == 100)
    {
          [self.navigationController popViewControllerAnimated:NO];
    }

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
