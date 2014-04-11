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
#import "CustomSegmentControl.h"


#define BackName1 @"4.png"
#define BackName2 @"3.png"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
//    UISwitch
//    UITextView
//    UIImageView
//    UIStatusBar
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
    for (int i= 0; i<rows; i++) {
        NSString *keyOfGroupItems = [NSString stringWithFormat:@"itemsOfGroup_%d",i];
        NSDictionary *lDic = [lDictionary objectForKey:keyOfGroupItems];
        [dynamicLayout loadItemsForGroup:lDic AndBaseView:self.view];
    }
//    [self.view addSubview:_lScrollView];
    
    NSDictionary *ldic = [dynamicLayout getItemsOfGroup:lDictionary];//直接调用解析的json文件的第一个字典
    NSLog(@"***************%@",ldic);
//    dynamicLayout.items = (NSMutableDictionary *)ldic;
//    NSLog(@"%@",dynamicLayout.items);
    [self achieveHandle:ldic];
    
//   customView *lCustomView = [[customView alloc]initWithFrame:CGRectMake(80, 400, 160, 100)];
//    lCustomView.tag = 23;
//    lCustomView.backgroundColor = [UIColor blueColor];
//    [lCustomView setimageWithView:^(customView *cusView){
//        UIImageView *imageView = [[UIImageView alloc]init];
//        imageView.contentMode = UIViewContentModeScaleAspectFit;
//        imageView.frame = lCustomView.bounds;
//        imageView.image = [UIImage imageNamed:@"2"];
//        [lCustomView addSubview:imageView];
//    }];
//    [self.view addSubview:lCustomView];

}

-(void)textClick{
    //do any additional setup
    
}
//获取控键并把响应事件的执行代码写入block中
-(void)achieveHandle:(NSDictionary *)dictionary{
  /*  customButton *cButton = (customButton *)[self.view viewWithTag:1001];
    __block customButton *cB = cButton;
    cButton.myblock = ^(customButton *button){
        //        [cB performSelector:@selector(buttonClick:)];
        if (cB.numOfType == 1) {
            firstViewController *lFirstVC = [[firstViewController alloc]init];
            [self presentViewController:lFirstVC animated:YES completion:nil];
        }
        if (cB.numOfType == 2)  {
            secondViewController *lSecondVC = [[secondViewController alloc]init];
            [self presentViewController:lSecondVC animated:YES completion:nil];
        }
        if (cB.numOfType == 3) {
            UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"提示" message:@"warning" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:@"取消", nil];
            [alertView show];
            NSLog(@"%ld",(long)alertView.cancelButtonIndex);
            NSLog(@"%ld",(long)alertView.firstOtherButtonIndex);
        }
        if (cB.numOfType == 4)  {
            //                    UIImage *image1 = [cB backgroundImageForState:UIControlStateNormal];
            //                    UIImage *image2 = [UIImage imageNamed:@"3"];
            //                    if ([[cB backgroundImageForState:UIControlStateNormal]isEqual:image1]) {
            //                        [cB setBackgroundImage:image2 forState:UIControlStateNormal];
            //                    }else{
            //                        [cB setBackgroundImage:image2 forState:UIControlStateNormal];
            //                    }
            
            NSLog(@"HELL");
            
        }
        NSLog(@"____________________");
    };*/
    int a=0;//记录button的事件个数
    int b=0;//记录customview的事件个数
    int c=0;//记录segment的事件个数
    int d=0;//记录slider的事件个数
    int e=0;//记录textfield被点击的事件触发
    int f=0;//记录pageControl被点击的事件触发
    NSArray *allOfValue = [dictionary allValues];
    for (int i=0; i<allOfValue.count; i++) {
        
        if ([[allOfValue objectAtIndex:i]isEqualToString:@"button"]) {
            a++;
            NSString *key = [NSString stringWithFormat:@"100%d",a];
//            NSLog(@"key=%@",key);
            customButton *cButton = (customButton *)[self.view viewWithTag:[key intValue]];
            __block customButton *cB = cButton;
            cButton.myblock = ^(customButton *button){
                //        [cB performSelector:@selector(buttonClick:)];
                if (cB.numOfType == 1) {
                    firstViewController *lFirstVC = [[firstViewController alloc]init];
                    [self presentViewController:lFirstVC animated:YES completion:nil];
                }
                if (cB.numOfType == 2)  {
                    secondViewController *lSecondVC = [[secondViewController alloc]init];
                    [self presentViewController:lSecondVC animated:YES completion:nil];
                }
                if (cB.numOfType == 3) {
                    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"提示" message:@"warning" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:@"取消", nil];
                    [alertView show];
                    NSLog(@"%ld",(long)alertView.cancelButtonIndex);
                    NSLog(@"%ld",(long)alertView.firstOtherButtonIndex);
                }
                if (cB.numOfType == 4)  {
                    UIImage *image1 = [UIImage imageNamed:BackName1];
                    UIImage *image2 = [UIImage imageNamed:BackName2];
                    if ([[cB backgroundImageForState:UIControlStateNormal]isEqual:image2]) {
                        [cB setBackgroundImage:image1 forState:UIControlStateNormal];
                    }else{
                        [cB setBackgroundImage:image2 forState:UIControlStateNormal];
                    }
                }
                NSLog(@"____________________");
            };

        }
        if ([[allOfValue objectAtIndex:i]isEqualToString:@"customView"]) {
            b++;
            NSString *key = [NSString stringWithFormat:@"400%d",b];
//            NSLog(@"key=%@",key);
            customView *cView = (customView *)[self.view viewWithTag:[key intValue]];
            __block customView *cV = cView;
            cView.customViewBlock =^(customView *cusVIew){
                [cV setBackgroundColor:[UIColor redColor]];
            };
        }
        if ([[allOfValue objectAtIndex:i]isEqualToString:@"segment"]) {
            c++;
            NSString *key = [NSString stringWithFormat:@"500%d",c];
            //            NSLog(@"key=%@",key);
            CustomSegmentControl *cSView = (CustomSegmentControl *)[self.view viewWithTag:[key intValue]];
            [cSView addTarget:self action:@selector(segmentClick:) forControlEvents:UIControlEventValueChanged];
        }
        if ([[allOfValue objectAtIndex:i]isEqualToString:@"slider"]) {
            d++;
            NSString *key = [NSString stringWithFormat:@"600%d",d];
            //            NSLog(@"key=%@",key);
            UISlider *sliderView = (UISlider *)[self.view viewWithTag:[key intValue]];
            UIImage *image = [UIImage imageNamed:@"4"];
            [sliderView setThumbImage:image forState:UIControlStateNormal];
            [sliderView addTarget:self action:@selector(sliderClick:) forControlEvents:UIControlEventValueChanged];
        }
        if ([[allOfValue objectAtIndex:i]isEqualToString:@"textField"]) {
            e++;
            NSString *key = [NSString stringWithFormat:@"300%d",e];
//            NSLog(@"key=%@",key);
            UITextField *textField = (UITextField *) [self.view viewWithTag:[key intValue]];
            textField.keyboardType = UIKeyboardTypeWebSearch;
            textField.clearButtonMode = UITextFieldViewModeWhileEditing;
            textField.borderStyle = UITextBorderStyleRoundedRect;
            [textField addTarget:self action:@selector(textFieldClick:) forControlEvents:UIControlEventEditingDidEndOnExit];
        }
        if ([[allOfValue objectAtIndex:i]isEqualToString:@"pageControl"]) {
            f++;
            NSString *key = [NSString stringWithFormat:@"700%d",f];
            UISlider *sliderView = (UISlider *)[self.view viewWithTag:[key intValue]];
            [sliderView addTarget:self action:@selector(pageControlClick:) forControlEvents:UIControlEventTouchUpInside];
        }


    }
    
}

#pragma mark UIsegmentControl click

-(void)sliderClick:(UISlider *)sender{
    NSLog(@"sender value : %.2f",sender.value);
}
#pragma mark UISlider  click
-(void)segmentClick:(CustomSegmentControl *)sender{
    if (sender.selectedSegmentIndex == 0 ) {
        NSLog(@"hello one");
    }
    if (sender.selectedSegmentIndex == 1) {
        NSLog(@"hello two");
    }
    if (sender.selectedSegmentIndex == 1) {
        NSLog(@"hello three");
    }
}
#pragma mark UIPageControl click
-(void)pageControlClick:(UIPageControl *)sender{
    NSLog(@"sender.currentPage : %ld",(long)sender.currentPage);
}
#pragma mark UITextField click
-(void)textFieldClick:(UITextField *)sender{
    [sender resignFirstResponder];
    NSLog(@"textField resignFirstResponder");
}

- (void)didReceiveMemoryWarning
{
//    NSString *sl = [[NSString alloc]init];
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
