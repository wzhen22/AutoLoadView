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
#import "BaseCellMember.h"

@interface firstViewController ()

@end
#define keyForRowData @"rowItems"
#define keyForSectionName @"sectionName"
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
//    [self addHeader];jhdgjdgjdhjdhj
//    [wCusTV.dataArray removeAllObjects];
//    [wCusTV reloadData];
    NSDictionary *ldic = [dynamicLayout getItemsOfGroup:lDictionary];//直接调用解析的json文件的第一个字典
    NSLog(@"***************%@",ldic);
    [self achieveHandle:ldic];
    
}

- (void)addHeader
{
    WCustomTableView *tableVC = (WCustomTableView *)[self.view viewWithTag:10001];
    RefreshHeaderView *headerView = [RefreshHeaderView header];
    headerView.scrollView  = tableVC;
    headerView.beginBolock = ^(WZRefreshBaseView *refreshView){
        NSMutableDictionary *dictionar =[[NSMutableDictionary alloc]init];
        NSMutableArray *itemArray = [[NSMutableArray alloc]init];
        for (int i = 0; i<2; i++) {
            BaseCellMember *member = [[BaseCellMember alloc]init];
            if (i%2==0) {
                member.mainString = @"hello ?";
                member.detailString = @"cs";
                member.isShowImage = YES;
                member.imageName = [UIImage imageNamed:@"5"];
            }else{
                
                member.mainString =@"hello!";
                member.detailString = @"me";
                member.isShowImage = NO;
                member.imageName = nil;
            }
            [itemArray addObject:member];
        }
        [dictionar setObject:itemArray forKey:keyForRowData];
        [dictionar setObject:@"section" forKey:keyForSectionName];
        [tableVC.dataArray addObject:dictionar];
        [tableVC performSelector:@selector(doneWithView:) withObject:refreshView afterDelay:2];
        
    };
    headerView.endBlock = ^(WZRefreshBaseView *refreshView){
        NSLog(@"refresh is end!");
    };
    headerView.changeBlock = ^(WZRefreshBaseView *refreshView,WZRefreshState state ){
        switch (state) {
            case WZRefreshStateDidRefreshing:
                NSLog(@"refreshing");
                break;
            case WZRefreshStateNormal:
                NSLog(@"normal");
                break;
            case WZRefreshStatePulling:
                NSLog(@"pulling");
                break;
            case WZRefreshStateWillRefreshing:
                NSLog(@"willRefreshing");
                break;
            default:
                break;
        }
    };
    [headerView beginRefreshing];

}

-(void)doneWithView:(WZRefreshBaseView *)refreshView{
    WCustomTableView *tableVC = (WCustomTableView *)[self.view viewWithTag:10001];
    [tableVC reloadData];
    [refreshView endRefreshing];
}


//对事件的描述方法
-(void)achieveHandle:(NSDictionary *)dictionary{
  
    int a=0;//记录button的事件个数
    int b=0;//记录customview的事件个数
//    int c=0;//记录segment的事件个数
//    int d=0;//记录slider的事件个数
//    int e=0;//记录textfield被点击的事件触发
//    int f=0;//记录pageControl被点击的事件触发
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
        
        
    }
    
}
-(NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath{

    return @"index";
}
//-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//  
//    
//}

-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleBlue;
    NSIndexPath *lastIndex = [tableView indexPathForSelectedRow];
    NSLog(@"%@",lastIndex);
    
    NSLog(@"hello");
}
-(void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath{
    
    NSLog(@"accessoryButtonTappedForRowWithIndexPath");
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 44)];
//    view.backgroundColor = [UIColor blueColor];
    UILabel *laber = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 60, 44)];
    laber.text =@"总计：";
    UILabel *wlaber = [[UILabel alloc]initWithFrame:CGRectMake(220, 0, 60, 44)];
    wlaber.text =@"$199";
    [view addSubview:laber];
    [view addSubview:wlaber];
    return view;
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
