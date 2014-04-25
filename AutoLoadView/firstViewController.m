//
//  firstViewController.m
//  AutoLoodViewDemo
//
//  Created by 传晟 on 14-3-11.
//  Copyright (c) 2014年 传晟. All rights reserved.
//

#import "firstViewController.h"
#import "secondViewController.h"
//#import "tableBarViewController.h"
#import "customButton.h"
#import "HeaderAndFooterRefresh.h"
#import "wDynamicLayout.h"
#import "customView.h"
#import "CustomSegmentControl.h"
#import "WCustomTableView.h"


@interface firstViewController ()

@end

@implementation firstViewController{
    int  responseOfType;
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    wDynamicLayout *dynamicLayout = [[wDynamicLayout alloc]init];
    NSString *lstring = [[NSBundle mainBundle] resourcePath];
    NSString *path = [lstring stringByAppendingPathComponent:@"firstViewController.json"];
    NSData *ldata = [NSData dataWithContentsOfFile:path options:NSDataReadingMappedIfSafe error:nil];
    NSDictionary *lDictionary = [NSJSONSerialization JSONObjectWithData:ldata options:NSJSONReadingAllowFragments error:nil];
    
    int rows = [[lDictionary objectForKey:@"rowsOfType"] intValue];//纪录json描绘的有多少行
    for (int i= 0; i<rows; i++) {
        NSString *keyOfGroupItems = [NSString stringWithFormat:@"itemsOfGroup_%d",i];
        NSDictionary *lDic = [lDictionary objectForKey:keyOfGroupItems];
        [dynamicLayout loadItemsForGroup:lDic AndBaseView:self.view];
    }
    WCustomTableView *wCusTV = (WCustomTableView *)[self.view viewWithTag:10001];
    wCusTV.delegate = self;
//    [wCusTV.dataArray removeAllObjects];
//    [wCusTV reloadData];
    NSDictionary *ldic = [dynamicLayout getItemsOfGroup:lDictionary];//直接调用解析的json文件的第一个字典
    NSLog(@"***************%@",ldic);
    [self achieveHandle:ldic];
    
}

//对事件的描述方法
-(void)achieveHandle:(NSDictionary *)dictionary{
  
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
                    [self dismissViewControllerAnimated:YES completion:nil];
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

-(void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath{
    
    NSLog(@"accessoryButtonTappedForRowWithIndexPath");
}
#pragma mark textField exit

-(void)textClick{
    //do any additional setup
    
}

//-(void)buttonClick:(customButton *)sender{
//    if (sender.numOfType == 0) {
//        [self dismissViewControllerAnimated:YES completion:nil];
//    }
//    if (sender.numOfType == 2) {
//        secondViewController *lSecondVC = [[secondViewController alloc]init];
//        [self presentViewController:lSecondVC animated:YES completion:nil];
//    }
//    if (sender.numOfType == 4) {
//        tableBarViewController *lTableVC = [[tableBarViewController alloc]init];
//        [self presentViewController:lTableVC animated:YES completion:nil];
//        
//    }
//}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
