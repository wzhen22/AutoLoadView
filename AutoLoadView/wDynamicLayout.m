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
#import "CustomScrollView.h"

@implementation wDynamicLayout{
    
}

-(void)loadItemsForGroup:(NSDictionary *)dictionary AndBaseView:(id)baseView{
    CountString *lCount = [[CountString alloc]init];
    
    NSArray *typeOfArray = @[@"button",@"label",@"textField",@"customView",@"segment",@"slider",@"pageControl",@"scollView"];//用于判断接受控键的类型
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
                    }//加载customButton
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
                    }//加载UILabel
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
                        lTextField.tag = [[AttributeDic objectForKey:@"TkeyOfTag"] intValue];
                        //设置输入的字体颜色
                        NSInteger num = [[AttributeDic objectForKey:@"TkeyTextColor"] intValue];
                        UIColor *currentColor = [self colorFromJSONnum:num];
                        lTextField.textColor = currentColor;
                        //设置文本框的字体、字体大小和背景提示字段
                        NSString *Fname = [AttributeDic objectForKey:@"TkeyFont"];
                        NSInteger Fsize = [[AttributeDic objectForKey:@"TkeyFontSize"] intValue];
                        lTextField.font = [UIFont fontWithName:Fname size:Fsize];
                        NSString *Pstring = [AttributeDic objectForKey:@"TkeyPlaceholder"];
                        lTextField.placeholder =Pstring;
                        
                        NSInteger tNum = [[AttributeDic objectForKey:@"TkeyAlignment"] intValue];
                        NSTextAlignment textA= [self acheiveTextAlignmentFromJSONnum:tNum];
                        [baseView addSubview:lTextField];
                        lTextField.textAlignment = textA;
                        break;
                    }//加载UITextField
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
                    }//加载customView
                    case 4:{
                        //判断初始化的标题是不是图片
                        NSDictionary *dictionary = [AttributeDic objectForKey:@"SkeyItems"];
                        NSArray *items = [[NSArray alloc]init];
                        if ([[AttributeDic objectForKey:@"SkeyIsPicture"] intValue]) {
                            items = [self imageOfArrayOfTitleFormJSON:dictionary];
                        }else{
                            items = [self titleOfArrayOfTitleFormJSON:dictionary];

                        }
//                        NSLog(@"%@",items);
                        CustomSegmentControl *lsegment = [[CustomSegmentControl alloc]initWithItems:items];
                        //设置lsegment的frame值
                        NSString *xString = [lCount getStatement:[AttributeDic objectForKey:@"SkeyCGRect_x"]];
                        CGFloat rect_x =[lCount operatorString:xString];
                        NSString *yString = [lCount getStatement:[AttributeDic objectForKey:@"SkeyCGRect_y"]];
                        CGFloat rect_y =[lCount operatorString:yString];
                        NSString *wString = [lCount getStatement:[AttributeDic objectForKey:@"SkeyCGRect_width"]];
                        CGFloat rect_width =[lCount operatorString:wString];
                        NSString *hString = [lCount getStatement:[AttributeDic objectForKey:@"SkeyCGRect_height"]];
                        CGFloat rect_height =[lCount operatorString:hString];
                        lsegment.frame = CGRectMake(rect_x,rect_y,rect_width,rect_height);
                        //设置lsegment的背景颜色
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
                    }//加载UISegment自定义的
                    case 5:{
                        UISlider *lSlider = [[UISlider alloc]init];
                        //设置lSlider的frame值
                        NSString *xString = [lCount getStatement:[AttributeDic objectForKey:@"SkeyCGRect_x"]];
                        CGFloat rect_x =[lCount operatorString:xString];
                        NSString *yString = [lCount getStatement:[AttributeDic objectForKey:@"SkeyCGRect_y"]];
                        CGFloat rect_y =[lCount operatorString:yString];
                        NSString *wString = [lCount getStatement:[AttributeDic objectForKey:@"SkeyCGRect_width"]];
                        CGFloat rect_width =[lCount operatorString:wString];
                        NSString *hString = [lCount getStatement:[AttributeDic objectForKey:@"SkeyCGRect_height"]];
                        CGFloat rect_height =[lCount operatorString:hString];
                        lSlider.frame = CGRectMake(rect_x,rect_y,rect_width,rect_height);
                        //设置lSlider的背景颜色
                        NSString *redString = [AttributeDic objectForKey:@"SkeyColorRGB_red"];
                        CGFloat RGBred = [lCount operatorString:redString];
                        NSString *greenString = [AttributeDic objectForKey:@"SkeyColorRGB_green"];
                        CGFloat RGBgreen = [lCount operatorString:greenString];
                        NSString *blueString = [AttributeDic objectForKey:@"SkeyColorRGB_blue"];
                        CGFloat RGBblue = [lCount operatorString:blueString];
                        CGFloat RGBalpha = [[AttributeDic objectForKey:@"SkeyColor_alpha"] floatValue];
                        lSlider.backgroundColor = [UIColor colorWithRed:RGBred green:RGBgreen blue:RGBblue alpha:RGBalpha];
                        //设置lSlider的tag值
                        lSlider.tag = [[AttributeDic objectForKey:@"SkeyOfTag"] intValue];
                        //设置lSlider的最小值
                        lSlider.minimumValue = [[AttributeDic objectForKey:@"SkeyMiniValue"] floatValue];
                        //设置lSlider的最大值
                        lSlider.maximumValue = [[AttributeDic objectForKey:@"SkeyMaxiValue"] floatValue];
                        //设置lSlider的当前值
                        lSlider.value = [[AttributeDic objectForKey:@"SkeyValue"] floatValue];
                        //设置lSlider两端或则任意一段是否添加图片
                        NSDictionary *dictionary = [AttributeDic objectForKey:@"SkeyItems"];
                        if ([[AttributeDic objectForKey:@"SkeyIsPicture"] intValue]) {
                            for (int i = 0; i<[dictionary.allKeys count]; i++) {
                                if ([[dictionary.allKeys objectAtIndex:i]isEqualToString:@"minimumValueInage"]) {
                                    NSString *nameImage = [dictionary objectForKey:@"minimumValueInage"];
                                    lSlider.minimumValueImage = [UIImage imageNamed:nameImage];
                                }
                                if ([[dictionary.allKeys objectAtIndex:i]isEqualToString:@"maximumValueImage"]) {
                                    NSString *nameImage = [dictionary objectForKey:@"maximumValueImage"];
                                    lSlider.maximumValueImage = [UIImage imageNamed:nameImage];
                                }
                            }
                                                   }
                        [baseView addSubview:lSlider];
                        break;
                    }//加载UISlider
                    case 6:{
                       UIPageControl *lPageControl = [[UIPageControl alloc]init];
                        //设置控键的frame值
                        NSString *xString = [lCount getStatement:[AttributeDic objectForKey:@"PkeyCGRect_x"]];
                        CGFloat rect_x =[lCount operatorString:xString];
                        NSString *yString = [lCount getStatement:[AttributeDic objectForKey:@"PkeyCGRect_y"]];
                        CGFloat rect_y =[lCount operatorString:yString];
                        NSString *wString = [lCount getStatement:[AttributeDic objectForKey:@"PkeyCGRect_width"]];
                        CGFloat rect_width =[lCount operatorString:wString];
                        NSString *hString = [lCount getStatement:[AttributeDic objectForKey:@"PkeyCGRect_height"]];
                        CGFloat rect_height =[lCount operatorString:hString];
                        lPageControl.frame = CGRectMake(rect_x,rect_y,rect_width,rect_height);
                        //设置控键的透明度，page数和当前在那一张page
                        lPageControl.alpha = [[AttributeDic objectForKey:@"PkeyAlpha"] floatValue];
                        lPageControl.numberOfPages = [[AttributeDic objectForKey:@"PkeyNumOfPages"] intValue];
                        lPageControl.currentPage = [[AttributeDic objectForKey:@"PkeyCurrentPage"] intValue];
                        //设置lpageControl的指示器颜色和背景颜色
                        NSInteger indicatorTC = [[AttributeDic objectForKey:@"PkeyITColor"] intValue];
                        UIColor *color1 = [self colorFromJSONnum:indicatorTC];
                        lPageControl.pageIndicatorTintColor = color1;
                        NSInteger cIndicatorTC = [[AttributeDic objectForKey:@"PkeyCurrentITColor"] intValue];
                        UIColor *color2 = [self colorFromJSONnum:cIndicatorTC];
                        lPageControl.currentPageIndicatorTintColor = color2;

                        NSInteger backCnum = [[AttributeDic objectForKey:@"PkeyBackColor"] intValue];
                        UIColor *color3 = [self colorFromJSONnum:backCnum];
                        lPageControl.backgroundColor = color3;
                        //设置lpageControl的tag值
                         lPageControl.tag = [[AttributeDic objectForKey:@"PkeyOfTag"] intValue];
                        [baseView addSubview:lPageControl];
                        
                        break;
                    }//加载UIPageControl
                    case 7:{
                        CustomScrollView *lscrollView = [[CustomScrollView alloc]init];
                        //设置lscrollView的frame值
                        NSString *xString = [lCount getStatement:[AttributeDic objectForKey:@"SkeyCGRect_x"]];
                        CGFloat rect_x =[lCount operatorString:xString];
                        NSString *yString = [lCount getStatement:[AttributeDic objectForKey:@"SkeyCGRect_y"]];
                        CGFloat rect_y =[lCount operatorString:yString];
                        NSString *wString = [lCount getStatement:[AttributeDic objectForKey:@"SkeyCGRect_width"]];
                        CGFloat rect_width =[lCount operatorString:wString];
                        NSString *hString = [lCount getStatement:[AttributeDic objectForKey:@"SkeyCGRect_height"]];
                        CGFloat rect_height =[lCount operatorString:hString];                        lscrollView.frame = CGRectMake(rect_x,rect_y,rect_width,rect_height);
                        //设置lscrollView的背景颜色
                        NSString *redString = [AttributeDic objectForKey:@"SkeyColorRGB_red"];
                        CGFloat RGBred = [lCount operatorString:redString];
                        NSString *greenString = [AttributeDic objectForKey:@"SkeyColorRGB_green"];
                        CGFloat RGBgreen = [lCount operatorString:greenString];
                        NSString *blueString = [AttributeDic objectForKey:@"SkeyColorRGB_blue"];
                        CGFloat RGBblue = [lCount operatorString:blueString];
                        CGFloat RGBalpha = [[AttributeDic objectForKey:@"SkeyColor_alpha"] floatValue];
                        lscrollView.backgroundColor = [UIColor colorWithRed:RGBred green:RGBgreen blue:RGBblue alpha:RGBalpha];
                        lscrollView.tag = [[AttributeDic objectForKey:@"SkeyOfTag"] intValue];
                        //加载嵌套的控键
                        NSDictionary *subDictionay = [AttributeDic objectForKey:@"subItems"];
                        [self loadItemsForGroup:subDictionay AndBaseView:lscrollView];
                        int t=0;
                        for (int i = 0; i<[subDictionay.allKeys count]; i++) {
                            if ([[subDictionay.allKeys objectAtIndex:i]hasPrefix:@"item_"]) {
                                t++;
                            }
                        }
                        lscrollView.numOfViews = t;//记录子控键个数
                        NSString *bstring = [AttributeDic objectForKey:@"SkeyBounces"];
                        lscrollView.bounces = [self boolFromJSON:[bstring integerValue]];
                        //设置滑动控制器的容量
                        CGFloat size_w = [[subDictionay objectForKey:@"subView_width"] floatValue];
                        CGFloat size_h = [[subDictionay objectForKey:@"subView_height"] floatValue];
                        NSInteger num1 = [[subDictionay objectForKey:@"everyRow_num"] integerValue];
                        lscrollView.contentSize = CGSizeMake(size_w *num1, size_h *(lscrollView.numOfViews / num1));
                        [baseView addSubview:lscrollView];
                        break;
                    }//加载scrollView
    
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
    
    NSArray *typeOfArray = @[@"button",@"label",@"textField",@"customView",@"segment",@"slider",@"pageControl",@"scollView"];//用于判断接受控键的类型
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
                        case 5:{
                            NSString *handlesOfType = [AttributeDic objectForKey:@"type"];
                            NSInteger numOfTag = [[AttributeDic objectForKey:@"SkeyOfTag"] intValue];
                            [lMdic setObject:handlesOfType forKey:[NSString stringWithFormat:@"%ld",(long)numOfTag]];
                            break;
                        }
                        case 6:{
                            NSString *handlesOfType = [AttributeDic objectForKey:@"type"];
                            NSInteger numOfTag = [[AttributeDic objectForKey:@"PkeyOfTag"] intValue];
                            [lMdic setObject:handlesOfType forKey:[NSString stringWithFormat:@"%ld",(long)numOfTag]];
                            break;
                        }
                        case 7:{
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

#pragma mark base method
-(UIColor *)colorFromJSONnum:(NSInteger)num{
    UIColor *Rcolor;
    switch (num) {
        case 0:
            Rcolor  = [UIColor blackColor];
            break;
        case 1:
            Rcolor  = [UIColor darkGrayColor];
            break;
        case 2:
            Rcolor  = [UIColor lightGrayColor];
            break;
        case 3:
            Rcolor  = [UIColor whiteColor];
            break;
        case 4:
            Rcolor  = [UIColor grayColor];
            break;
        case 5:
            Rcolor  = [UIColor redColor];
            break;
        case 6:
            Rcolor  = [UIColor greenColor];
            break;
        case 7:
            Rcolor  = [UIColor blueColor];
            break;
        case 8:
            Rcolor  = [UIColor cyanColor];
            break;
        case 9:
            Rcolor  = [UIColor yellowColor];
            break;
        case 10:
            Rcolor  = [UIColor magentaColor];
            break;
        case 11:
            Rcolor  = [UIColor orangeColor];
            break;
        case 12:
            Rcolor  = [UIColor purpleColor];
            break;
        case 13:
            Rcolor  = [UIColor brownColor];
            break;
        case 14:
            Rcolor  = [UIColor clearColor];
            break;

        default:
        Rcolor  = [UIColor clearColor];
            break;
    }
    return Rcolor;
}

-(NSTextAlignment) acheiveTextAlignmentFromJSONnum:(NSInteger)num{
    NSTextAlignment textAlignment;
    switch (num) {
        case 1:
        textAlignment = NSTextAlignmentCenter;
        break;
        case 2:
        textAlignment = NSTextAlignmentRight;
        break;
        case 3:
        textAlignment = NSTextAlignmentJustified;
        break;
        case 4:
        textAlignment = NSTextAlignmentNatural;
        break;
        default:
        textAlignment = NSTextAlignmentLeft;
        break;
    }
    return textAlignment;
}

-(CGPoint) pointFromJSON:(NSDictionary *)dictionary{
    CGPoint point;
    CGFloat x = [[dictionary objectForKey:@"keyPoint_x"] floatValue];
    CGFloat y = [[dictionary objectForKey:@"keyPoint_y"] floatValue];
    point.x = x;
    point.y = y;
    return point;
}

-(CGSize )sizeFromJSON:(NSDictionary *)dictionary{
    CGSize size;
    CGFloat width = [[dictionary objectForKey:@"keySize_width"] floatValue];
    CGFloat height = [[dictionary objectForKey:@"keySize_height"] floatValue];
    size.width = width;
    size.height = height;
    return size;
}

-(CGRect )rectFromJSON:(NSDictionary *)dictionary{
    CGRect rect;
    NSDictionary  *dicForPoint = [dictionary objectForKey:@"keyPoint"];
    NSDictionary *dicForSize = [dictionary objectForKey:@"keySize"];
    rect.origin = [self pointFromJSON:dicForPoint];
    rect.size = [self sizeFromJSON:dicForSize];
    return rect;
}

-(BOOL) boolFromJSON:(NSInteger )integer{
    BOOL isOK;
    if (integer != 0) {
        isOK = YES;
    }else{
        isOK  = NO;
    }
    return isOK;
}
-(void)textClick{
    //do any additional setup
    NSLog(@"text disappear!");
    
}

@end
