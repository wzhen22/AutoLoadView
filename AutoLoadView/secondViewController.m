//
//  secondViewController.m
//  AutoLoodViewDemo
//
//  Created by 传晟 on 14-3-11.
//  Copyright (c) 2014年 传晟. All rights reserved.
//

#import "secondViewController.h"
#import "firstViewController.h"

@interface secondViewController ()

@end

@implementation secondViewController

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
    self.view.backgroundColor = [UIColor grayColor];
	// Do any additional setup after loading the view.
//    NSArray *typeOfArray = @[@"button",@"label",@"textField"];//用于判断接受控键的类型
//    
//    NSString *lstring = [[NSBundle mainBundle] resourcePath];
//    NSString *path = [lstring stringByAppendingPathComponent:@"DocumentsLayout_2.json"];
//    NSData *ldata = [NSData dataWithContentsOfFile:path options:NSDataReadingMappedIfSafe error:nil];
//    NSDictionary *lDictionary = [NSJSONSerialization JSONObjectWithData:ldata options:NSJSONReadingAllowFragments error:nil];//通过json文件解析出来的字典用于动态布局
//    NSLog(@"%@",lDictionary);
//    
//    NSInteger numOfitems;               //纪录需要布局的控键的个数
//    numOfitems = [lDictionary allKeys].count-1;
//    for (int i=0;  i<numOfitems;i++) {
//        NSString *lKeyString = [NSString stringWithFormat:@"item_%d",i];
//        NSDictionary *AttributeDic = [lDictionary objectForKey:lKeyString];
//        NSLog(@"%@",AttributeDic);
//        
//        for (int j = 0; j<typeOfArray.count; j++) {
//            if ([[typeOfArray objectAtIndex:j]isEqualToString:[AttributeDic objectForKey:@"type"]]) {
//                NSLog(@"%d",j);
//                switch (j) {
//                    case 0:{
//                        UIButton *lButton = [[UIButton alloc]init];
//                        CGFloat rect_x= [[AttributeDic objectForKey:@"BkeyCGRect_x"] floatValue];
//                        CGFloat rect_y= [[AttributeDic objectForKey:@"BkeyCGRect_y"] floatValue];
//                        CGFloat rect_width= [[AttributeDic objectForKey:@"BkeyCGRect_width"] floatValue];
//                        CGFloat rect_height= [[AttributeDic objectForKey:@"BkeyCGRect_height"] floatValue];
//                        //                        NSLog(@"%f,%f,%f,%f",rect_x,rect_y,rect_width,rect_height);
//                        lButton.frame = CGRectMake(rect_x,rect_y,rect_width,rect_height);
//                        //                        CGFloat RGB_red = [AttributeDic objectForKey:@"<#string#>"];
//                        lButton.backgroundColor = [UIColor colorWithRed:100/255 green:100/255 blue:100/255 alpha:1];
//                        NSString *nameOfButton = [AttributeDic objectForKey:@"BkeyNameOfText"];
//                        [lButton setTitle:nameOfButton forState:UIControlStateNormal];
//                        [lButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
//                        responseOfType = [[AttributeDic objectForKey:@"BkeyOfClick"] intValue];
//                        [self.view addSubview:lButton];
//                        
//                        break;
//                    }
//                    case 1:{
//                        UILabel *lLabel = [[UILabel alloc]init];
//                        CGFloat rect_x= [[AttributeDic objectForKey:@"LkeyCGRect_x"] floatValue];
//                        CGFloat rect_y= [[AttributeDic objectForKey:@"LkeyCGRect_y"] floatValue];
//                        CGFloat rect_width= [[AttributeDic objectForKey:@"LkeyCGRect_width"] floatValue];
//                        CGFloat rect_height= [[AttributeDic objectForKey:@"LkeyCGRect_height"] floatValue];
//                        lLabel.frame = CGRectMake(rect_x,rect_y,rect_width,rect_height);
//                        lLabel.text = [AttributeDic objectForKey:@"LkeyText"];
//                        lLabel.textAlignment = [[AttributeDic objectForKey:@"LkeyAlignment"] intValue];
//                        lLabel.backgroundColor = [UIColor redColor];
//                        [self.view addSubview:lLabel];
//                        
//                        break;
//                    }
//                    case 2:{
//                        UITextField *lTextField = [[UITextField alloc]init];
//                        CGFloat rect_x= [[AttributeDic objectForKey:@"TkeyCGRect_x"] floatValue];
//                        CGFloat rect_y= [[AttributeDic objectForKey:@"TkeyCGRect_y"] floatValue];
//                        CGFloat rect_width= [[AttributeDic objectForKey:@"TkeyCGRect_width"] floatValue];
//                        CGFloat rect_height= [[AttributeDic objectForKey:@"TkeyCGRect_height"] floatValue];
//                        lTextField.frame = CGRectMake(rect_x,rect_y,rect_width,rect_height);
//                        lTextField.backgroundColor = [UIColor blueColor];
//                        [lTextField addTarget:self action:@selector(textClick) forControlEvents:UIControlEventEditingDidEndOnExit];
//                        [self.view addSubview:lTextField];
//                        
//                        break;
//                    }
//                        
//                    default:
//                        break;
//                }
//                break;
//            }
//            //            NSLog(@"dsfdsfsdf");
//        }
//    }
    
    
}
#pragma mark textField exit

-(void)textClick{
    //do any additional setup
    
}

//-(void)buttonClick:(UIButton *)sender{
//    if (responseOfType == 0) {
//        [self dismissViewControllerAnimated:YES completion:nil];
//    }
//    if (responseOfType == 2) {
//        firstViewController *lSecondVC = [[firstViewController alloc]init];
//        [self presentViewController:lSecondVC animated:YES completion:nil];
//    }
//}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
