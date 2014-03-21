//
//  ViewController.m
//  AutoLoadView
//
//  Created by 传晟 on 14-3-18.
//  Copyright (c) 2014年 传晟. All rights reserved.
//

#import "ViewController.h"
#import "customButton.h"
#import "wDynamicLayout.h"
#import "customView.h"
#import "firstViewController.h"
#import "secondViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    wDynamicLayout *dynamicLayout = [[wDynamicLayout alloc]init];
    NSString *lstring = [[NSBundle mainBundle] resourcePath];
    NSString *path = [lstring stringByAppendingPathComponent:@"DocumentsLayout.json"];
    NSData *ldata = [NSData dataWithContentsOfFile:path options:NSDataReadingMappedIfSafe error:nil];
    NSDictionary *lDictionary = [NSJSONSerialization JSONObjectWithData:ldata options:NSJSONReadingAllowFragments error:nil];
//    [DataListClass sharDataClass].dictionary = lDictionary;//存储可能需要的公共数据；
    //    NSLog(@"%@",lDictionary);
    
    self.lScrollView = [[UIScrollView alloc]init];
    self.lScrollView.frame = CGRectMake(0, 22, 320, 400);
//    self.lScrollView.frame = self.view.bounds;
    
    self.lScrollView.contentSize = CGSizeMake(400, 400);
    NSLog(@"%f",self.view.bounds.size.height);
    [self.lScrollView setBackgroundColor:[UIColor purpleColor]];
    int rows = [[lDictionary objectForKey:@"rowsOfType"] intValue];//纪录json描绘的有多少行
    for (int i= 0; i<rows-2; i++) {
        NSString *keyOfGroupItems = [NSString stringWithFormat:@"itemsOfGroup_%d",i];
        NSDictionary *lDic = [lDictionary objectForKey:keyOfGroupItems];
        [dynamicLayout loadItemsForGroup:lDic AndBaseView:self.lScrollView];
    }
    [self.view addSubview:_lScrollView];
    
    NSDictionary *ldic = [dynamicLayout getItemsOfGroup:lDictionary];//直接调用解析的json文件的第一个字典
    NSLog(@"***************%@",ldic);
    dynamicLayout.items = (NSMutableDictionary *)ldic;
    NSLog(@"%@",dynamicLayout.items);
    
    
    customView *lCustomView = [[customView alloc]initWithFrame:CGRectMake(80, 400, 160, 100)];
    lCustomView.backgroundColor = [UIColor whiteColor];
    [lCustomView setimageWithView:^(void){
        UIImageView *imageView = [[UIImageView alloc]init];
        imageView.frame = CGRectMake(80, 400, 160, 100);
        imageView.image = [UIImage imageNamed:@"2"];
        [self.view addSubview:imageView];
    }];
    
    [self achieveHandle];
    
    [self.view addSubview:lCustomView];

}

-(void)textClick{
    //do any additional setup
    
}
//获取控键
-(void)achieveHandle{
    customButton *cButton = (customButton *)[self.view viewWithTag:1001];
    __block customButton *cB = cButton;
    cButton.myblock = ^(customButton *button){
        //        [cB performSelector:@selector(buttonClick:)];
        if (cB.numOfType == 1) {
            firstViewController *lFirstVC = [[firstViewController alloc]init];
            [self presentViewController:lFirstVC animated:YES completion:nil];
        }
        if (cB.numOfType == 2) {
            secondViewController *lSecondVC = [[secondViewController alloc]init];
            [self presentViewController:lSecondVC animated:YES completion:nil];
        }
        if (cB.numOfType == 3) {
            UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"提示" message:@"warning" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:@"取消", nil];
            [alertView show];
            NSLog(@"%ld",(long)alertView.cancelButtonIndex);
            NSLog(@"%ld",(long)alertView.firstOtherButtonIndex);
        }
        
        NSLog(@"____________________");
    };
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
