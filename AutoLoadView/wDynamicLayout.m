//
//  wDynamicLayout.m
//  AutoLoodViewDemo
//
//  Created by 传晟 on 14-3-18.
//  Copyright (c) 2014年 传晟. All rights reserved.
//

#import "wDynamicLayout.h"
#import "customButton.h"
#import "customView.h"
#import "CustomSegmentControl.h"


@implementation wDynamicLayout{
    
}

-(void)loadItemsForGroup:(NSDictionary *)dictionary AndBaseView:(id)baseView{
    CountString *lCount = [[CountString alloc]init];
    
    NSArray *typeOfArray = @[@"button",@"label",@"textField",@"customView",@"segment"];//用于判断接受控键的类型
    NSDictionary *lDictionary = dictionary;//通过json文件解析出来的字典用于动态布局
    NSInteger numOfitems;               //纪录需要布局的控键的个数
    numOfitems = [lDictionary allKeys].count;
    for (int i=0;  i<numOfitems;i++) {
        NSString *lKeyString = [NSString stringWithFormat:@"item_%d",i];
        NSDictionary *AttributeDic = [lDictionary objectForKey:lKeyString];
        for (int j = 0; j<typeOfArray.count; j++) {
            if ([[typeOfArray objectAtIndex:j]isEqualToString:[AttributeDic objectForKey:@"type"]]) {
                switch (j) {
                    case 0:{
                        //设置控键的类型
                        customButton *lButton = [customButton buttonWithType:[[AttributeDic objectForKey:@"BkeyNumOfType"] intValue]];
                        //设置控键的frame值
                        NSString *xString = [lCount getStatement:[AttributeDic objectForKey:@"BkeyCGRect_x"]];
                        CGFloat rect_x =[lCount operatorString:xString];
                        NSString *yString = [lCount getStatement:[AttributeDic objectForKey:@"BkeyCGRect_y"]];
                        CGFloat rect_y =[lCount operatorString:yString];
                        NSString *wString = [lCount getStatement:[AttributeDic objectForKey:@"BkeyCGRect_width"]];
                        CGFloat rect_width =[lCount operatorString:wString];
                        NSString *hString = [lCount getStatement:[AttributeDic objectForKey:@"BkeyCGRect_height"]];
                        CGFloat rect_height =[lCount operatorString:hString];
                        lButton.frame = CGRectMake(rect_x,rect_y,rect_width,rect_height);
                        //设置控键的背景颜色
                        NSString *redString = [AttributeDic objectForKey:@"BkeyColorRGB_red"];
                        CGFloat RGBred = [lCount operatorString:redString];
                        NSString *greenString = [AttributeDic objectForKey:@"BkeyColorRGB_green"];
                        CGFloat RGBgreen = [lCount operatorString:greenString];
                        NSString *blueString = [AttributeDic objectForKey:@"BkeyColorRGB_blue"];
                        CGFloat RGBblue = [lCount operatorString:blueString];
                        CGFloat RGBalpha = [[AttributeDic objectForKey:@"BkeyColor_alpha"] floatValue];
                        lButton.backgroundColor = [UIColor colorWithRed:RGBred green:RGBgreen blue:RGBblue alpha:RGBalpha];
                        // 设置控键的圆角情况
                        lButton.layer.cornerRadius = [[AttributeDic objectForKey:@"BkeyNumOfRadius"] floatValue];
                        //设置控键的背景图片
                        NSString *backImageName = [AttributeDic objectForKey:@"BkeyOfImageName"];
                        [lButton setBackgroundImage:[UIImage imageNamed:backImageName] forState:UIControlStateNormal];
                        lButton.contentMode = UIViewContentModeScaleAspectFill;
                        //设置控键的标题名称
                        NSString *nameOfButton = [AttributeDic objectForKey:@"BkeyNameOfText"];
                        [lButton setTitle:nameOfButton forState:UIControlStateNormal];
                        lButton.numOfType = [[AttributeDic objectForKey:@"BkeyOfClick"] intValue];
                        lButton.tag = [[AttributeDic objectForKey:@"BkeyOfTag"] intValue];//设置控键的tag值
                        [baseView addSubview:lButton];
                        break;
                    }
                    case 1:{
                        UILabel *lLabel = [[UILabel alloc]init];
                        //设置控键的frame值
                        NSString *xString = [lCount getStatement:[AttributeDic objectForKey:@"LkeyCGRect_x"]];
                        CGFloat rect_x =[lCount operatorString:xString];
                        NSString *yString = [lCount getStatement:[AttributeDic objectForKey:@"LkeyCGRect_y"]];
                        CGFloat rect_y =[lCount operatorString:yString];
                        NSString *wString = [lCount getStatement:[AttributeDic objectForKey:@"LkeyCGRect_width"]];
                        CGFloat rect_width =[lCount operatorString:wString];
                        NSString *hString = [lCount getStatement:[AttributeDic objectForKey:@"LkeyCGRect_height"]];
                        CGFloat rect_height =[lCount operatorString:hString];
                        lLabel.frame = CGRectMake(rect_x,rect_y,rect_width,rect_height);
                        //设置label的显示值
                        lLabel.text = [AttributeDic objectForKey:@"LkeyText"];
                        //设置label的对齐方式
                        lLabel.textAlignment = [[AttributeDic objectForKey:@"LkeyAlignment"] intValue];
                        //设置label的背景颜色
                        NSString *redString = [AttributeDic objectForKey:@"LkeyColorRGB_red"];
                        CGFloat RGBred = [lCount operatorString:redString];
                        NSString *greenString = [AttributeDic objectForKey:@"LkeyColorRGB_green"];
                        CGFloat RGBgreen = [lCount operatorString:greenString];
                        NSString *blueString = [AttributeDic objectForKey:@"LkeyColorRGB_blue"];
                        CGFloat RGBblue = [lCount operatorString:blueString];
                        CGFloat RGBalpha = [[AttributeDic objectForKey:@"LkeyColor_alpha"] floatValue];
                        lLabel.backgroundColor = [UIColor colorWithRed:RGBred green:RGBgreen blue:RGBblue alpha:RGBalpha];
                        [baseView addSubview:lLabel];
                        
                        break;
                    }
                    case 2:{
                        UITextField *lTextField = [[UITextField alloc]init];
                        //设置textfield的frame值
                        NSString *xString = [lCount getStatement:[AttributeDic objectForKey:@"TkeyCGRect_x"]];
                        CGFloat rect_x =[lCount operatorString:xString];
                        NSString *yString = [lCount getStatement:[AttributeDic objectForKey:@"TkeyCGRect_y"]];
                        CGFloat rect_y =[lCount operatorString:yString];
                        NSString *wString = [lCount getStatement:[AttributeDic objectForKey:@"TkeyCGRect_width"]];
                        CGFloat rect_width =[lCount operatorString:wString];
                        NSString *hString = [lCount getStatement:[AttributeDic objectForKey:@"TkeyCGRect_height"]];
                        CGFloat rect_height =[lCount operatorString:hString];
                        lTextField.frame = CGRectMake(rect_x,rect_y,rect_width,rect_height);
                        //设置textfield的背景颜色
                        NSString *redString = [AttributeDic objectForKey:@"TkeyColorRGB_red"];
                        CGFloat RGBred = [lCount operatorString:redString];
                        NSString *greenString = [AttributeDic objectForKey:@"TkeyColorRGB_green"];
                        CGFloat RGBgreen = [lCount operatorString:greenString];
                        NSString *blueString = [AttributeDic objectForKey:@"TkeyColorRGB_blue"];
                        CGFloat RGBblue = [lCount operatorString:blueString];
                        CGFloat RGBalpha = [[AttributeDic objectForKey:@"TkeyColor_alpha"] floatValue];
                        lTextField.backgroundColor = [UIColor colorWithRed:RGBred green:RGBgreen blue:RGBblue alpha:RGBalpha];
//                        [lTextField addTarget:self action:@selector(textClick) forControlEvents:UIControlEventEditingDidEndOnExit];
                        [baseView addSubview:lTextField];
                        
                        break;
                    }
                    case 3:{
                        customView *lCustomView = [[customView alloc]init];
                        //设置lCustomView的frame值
                        NSString *xString = [lCount getStatement:[AttributeDic objectForKey:@"CkeyCGRect_x"]];
                        CGFloat rect_x =[lCount operatorString:xString];
                        NSString *yString = [lCount getStatement:[AttributeDic objectForKey:@"CkeyCGRect_y"]];
                        CGFloat rect_y =[lCount operatorString:yString];
                        NSString *wString = [lCount getStatement:[AttributeDic objectForKey:@"CkeyCGRect_width"]];
                        CGFloat rect_width =[lCount operatorString:wString];
                        NSString *hString = [lCount getStatement:[AttributeDic objectForKey:@"CkeyCGRect_height"]];
                        CGFloat rect_height =[lCount operatorString:hString];
                        lCustomView.frame = CGRectMake(rect_x,rect_y,rect_width,rect_height);
                        //设置lCustomView的背景颜色
                        NSString *redString = [AttributeDic objectForKey:@"CkeyColorRGB_red"];
                        CGFloat RGBred = [lCount operatorString:redString];
                        NSString *greenString = [AttributeDic objectForKey:@"CkeyColorRGB_green"];
                        CGFloat RGBgreen = [lCount operatorString:greenString];
                        NSString *blueString = [AttributeDic objectForKey:@"CkeyColorRGB_blue"];
                        CGFloat RGBblue = [lCount operatorString:blueString];
                        CGFloat RGBalpha = [[AttributeDic objectForKey:@"CkeyColor_alpha"] floatValue];
                        lCustomView.backgroundColor = [UIColor colorWithRed:RGBred green:RGBgreen blue:RGBblue alpha:RGBalpha];
                        lCustomView.tag = [[AttributeDic objectForKey:@"CkeyOfTag"] intValue];
                        //加载嵌套的控键
                        NSDictionary *subDictionay = [AttributeDic objectForKey:@"subItems"];
                        [self loadItemsForGroup:subDictionay AndBaseView:lCustomView];
                        [baseView addSubview:lCustomView];
                        break;
                    }
                    case 4:{
                        //判断初始化的标题是不是图片
                        NSDictionary *dictionary = [AttributeDic objectForKey:@"SkeyItems"];
                        NSArray *items = [[NSArray alloc]init];
                        if ([[AttributeDic objectForKey:@"SkeyIsPicture"] intValue]) {
                            items = [self imageOfArrayOfTitleFormJSON:dictionary];
                        }else{
                            items = [self titleOfArrayOfTitleFormJSON:dictionary];

                        }
                        NSLog(@"%@",items);
                        CustomSegmentControl *lsegment = [[CustomSegmentControl alloc]initWithItems:items];
                        //设置lCustomView的frame值
                        NSString *xString = [lCount getStatement:[AttributeDic objectForKey:@"SkeyCGRect_x"]];
                        CGFloat rect_x =[lCount operatorString:xString];
                        NSString *yString = [lCount getStatement:[AttributeDic objectForKey:@"SkeyCGRect_y"]];
                        CGFloat rect_y =[lCount operatorString:yString];
                        NSString *wString = [lCount getStatement:[AttributeDic objectForKey:@"SkeyCGRect_width"]];
                        CGFloat rect_width =[lCount operatorString:wString];
                        NSString *hString = [lCount getStatement:[AttributeDic objectForKey:@"SkeyCGRect_height"]];
                        CGFloat rect_height =[lCount operatorString:hString];
                        lsegment.frame = CGRectMake(rect_x,rect_y,rect_width,rect_height);
                        //设置lCustomView的背景颜色
                        NSString *redString = [AttributeDic objectForKey:@"SkeyColorRGB_red"];
                        CGFloat RGBred = [lCount operatorString:redString];
                        NSString *greenString = [AttributeDic objectForKey:@"SkeyColorRGB_green"];
                        CGFloat RGBgreen = [lCount operatorString:greenString];
                        NSString *blueString = [AttributeDic objectForKey:@"SkeyColorRGB_blue"];
                        CGFloat RGBblue = [lCount operatorString:blueString];
                        CGFloat RGBalpha = [[AttributeDic objectForKey:@"SkeyColor_alpha"] floatValue];
                        lsegment.backgroundColor = [UIColor colorWithRed:RGBred green:RGBgreen blue:RGBblue alpha:RGBalpha];
                        lsegment.tag = [[AttributeDic objectForKey:@"SkeyOfTag"] intValue];
                        [baseView addSubview:lsegment];
                        break;
                    }

                        
                    default:
                        break;
                }
                break;
            }
            //            NSLog(@"dsfdsfsdf");
        }

    }
    
    
}

//-(void)setItems:(NSMutableDictionary *)items{
//    if (items == nil) {
//        items  = [[NSMutableDictionary alloc]init];
//    }
//    items = lMdic;
//}

-(NSDictionary *)getItemsOfGroup:(NSDictionary *)wDictionary{
    
    NSArray *typeOfArray = @[@"button",@"label",@"textField",@"customView",@"segment"];//用于判断接受控键的类型
    NSMutableDictionary *lMdic = [[NSMutableDictionary alloc]init];
    NSInteger rows = [[wDictionary objectForKey:@"rowsOfType"] intValue];//纪录json描绘的有多少行
    NSInteger numOfitems;//纪录每一行需要布局的控键的个数
    for (int i= 0; i<rows; i++) {
        NSString *keyOfGroupItems = [NSString stringWithFormat:@"itemsOfGroup_%d",i];
        NSDictionary *lDic = [wDictionary objectForKey:keyOfGroupItems];
        numOfitems = [lDic allKeys].count;
        for (int i=0;  i<numOfitems;i++) {
            NSString *lKeyString = [NSString stringWithFormat:@"item_%d",i];
            NSDictionary *AttributeDic = [lDic objectForKey:lKeyString];
            for (int j = 0; j<typeOfArray.count; j++) {
                if ([[typeOfArray objectAtIndex:j]isEqualToString:[AttributeDic objectForKey:@"type"]]) {
                    switch (j) {
                        case 0:{
                            NSString *handlesOfType = [AttributeDic objectForKey:@"type"];
                            NSInteger numOfTag = [[AttributeDic objectForKey:@"BkeyOfTag"] intValue];
                            [lMdic setObject:handlesOfType forKey:[NSString stringWithFormat:@"%ld",(long)numOfTag]];
                            break;
                        }
                        case 1:{
                            NSString *handlesOfType = [AttributeDic objectForKey:@"type"];
                            NSInteger numOfTag = [[AttributeDic objectForKey:@"LkeyOfTag"] intValue];
                            [lMdic setObject:handlesOfType forKey:[NSString stringWithFormat:@"%ld",(long)numOfTag]];
                            break;
                        }
                        case 2:{
                            NSString *handlesOfType = [AttributeDic objectForKey:@"type"];
                            NSInteger numOfTag = [[AttributeDic objectForKey:@"TkeyOfTag"] intValue];
                            [lMdic setObject:handlesOfType forKey:[NSString stringWithFormat:@"%ld",(long)numOfTag]];
                            break;
                        }
                        case 3:{
                            NSString *handlesOfType = [AttributeDic objectForKey:@"type"];
                            NSInteger numOfTag = [[AttributeDic objectForKey:@"CkeyOfTag"] intValue];
                            [lMdic setObject:handlesOfType forKey:[NSString stringWithFormat:@"%ld",(long)numOfTag]];
                            //把子布局字典里面的tag值存入总的返回字典
                            NSDictionary *subDic = [AttributeDic objectForKey:@"subItems"];//subItems与itemsOfGroup同级
                            for (int t=0; t<[subDic allKeys].count; t++) {
                                NSString *lKeyString = [NSString stringWithFormat:@"item_%d",t];
                                NSDictionary *subItemOfDic = [subDic objectForKey:lKeyString];
                                if ([[subItemOfDic objectForKey:@"type"]isEqualToString:@"button"]) {
                                    NSString *lstr = [subItemOfDic objectForKey:@"type"];
                                    NSInteger subItemTag = [[subItemOfDic objectForKey:@"BkeyOfTag"] intValue];
                                    [lMdic setObject:lstr forKey:[NSString stringWithFormat:@"%ld",(long)subItemTag]];
                                    continue;
                                }
                                if ([[subItemOfDic objectForKey:@"type"]isEqualToString:@"label"]) {
                                    NSString *lstr = [subItemOfDic objectForKey:@"type"];
                                    NSInteger subItemTag = [[subItemOfDic objectForKey:@"LkeyOfTag"] intValue];
                                    [lMdic setObject:lstr forKey:[NSString stringWithFormat:@"%ld",(long)subItemTag]];
                                    continue;
                                }
                                if ([[subItemOfDic objectForKey:@"type"]isEqualToString:@"textField"]) {
                                    NSString *lstr = [subItemOfDic objectForKey:@"type"];
                                    NSInteger subItemTag = [[subItemOfDic objectForKey:@"TkeyOfTag"] intValue];
                                    [lMdic setObject:lstr forKey:[NSString stringWithFormat:@"%ld",(long)subItemTag]];
                                    continue;
                                }
                                if ([[subItemOfDic objectForKey:@"type"]isEqualToString:@"customView"]) {
                                    NSString *lstr = [subItemOfDic objectForKey:@"type"];
                                    NSInteger subItemTag = [[subItemOfDic objectForKey:@"CkeyOfTag"] intValue];
                                    [lMdic setObject:lstr forKey:[NSString stringWithFormat:@"%ld",(long)subItemTag]];
                                    continue;
                                }

                            }
                           
                            break;
                        }
                        case 4:{
                            NSString *handlesOfType = [AttributeDic objectForKey:@"type"];
                            NSInteger numOfTag = [[AttributeDic objectForKey:@"SkeyOfTag"] intValue];
                            [lMdic setObject:handlesOfType forKey:[NSString stringWithFormat:@"%ld",(long)numOfTag]];
                            break;
                        }

                        default:
                            break;
                    }
                    break;
                }
            }
            
        }

    }
        return lMdic;
    SmartCellRelease(lMdic);
}

-(id) viewOfItems:(NSDictionary *)array andTag:(NSInteger )num{
    return 0;
}
#pragma mark parse segment about items
-(NSArray *)titleOfArrayOfTitleFormJSON:(NSDictionary *)dictionary{
    NSMutableArray *jArray = [[NSMutableArray alloc]initWithCapacity:10];
    for (int i = 0; i<dictionary.allKeys.count; i++) {
        NSString *string = [dictionary objectForKey:[NSString stringWithFormat:@"segment_%d",i]];
        [jArray addObject:string];
    }
    return jArray;
}
-(NSArray *)imageOfArrayOfTitleFormJSON:(NSDictionary *)dictionary{
    NSMutableArray *jArray = [[NSMutableArray alloc]initWithCapacity:10];
    for (int i = 0; i<dictionary.allKeys.count; i++) {
        NSString *string = [dictionary objectForKey:[NSString stringWithFormat:@"segment_%d",i]];
        UIImage *image = [UIImage imageNamed:string];
        [jArray addObject:image];
    }
    return jArray;
}


-(void)textClick{
    //do any additional setup
    NSLog(@"text disappear!");
    
}

@end
