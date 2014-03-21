//
//  wDynamicLayout.m
//  AutoLoodViewDemo
//
//  Created by 传晟 on 14-3-18.
//  Copyright (c) 2014年 传晟. All rights reserved.
//

#import "wDynamicLayout.h"
#import "customButton.h"


@implementation wDynamicLayout{
    
}

-(void)loadItemsForGroup:(NSDictionary *)dictionary AndBaseView:(id)baseView{
    NSArray *typeOfArray = @[@"button",@"label",@"textField"];//用于判断接受控键的类型
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
                        CGFloat rect_x= [[AttributeDic objectForKey:@"BkeyCGRect_x"] floatValue];
                        CGFloat rect_y= [[AttributeDic objectForKey:@"BkeyCGRect_y"] floatValue];
                        CGFloat rect_width= [[AttributeDic objectForKey:@"BkeyCGRect_width"] floatValue];
                        CGFloat rect_height= [[AttributeDic objectForKey:@"BkeyCGRect_height"] floatValue];
                        lButton.frame = CGRectMake(rect_x,rect_y,rect_width,rect_height);
                        //设置控键的背景颜色
                        lButton.backgroundColor = [UIColor colorWithRed:100/255 green:100/255 blue:100/255 alpha:1];
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
                        CGFloat rect_x= [[AttributeDic objectForKey:@"LkeyCGRect_x"] floatValue];
                        CGFloat rect_y= [[AttributeDic objectForKey:@"LkeyCGRect_y"] floatValue];
                        CGFloat rect_width= [[AttributeDic objectForKey:@"LkeyCGRect_width"] floatValue];
                        CGFloat rect_height= [[AttributeDic objectForKey:@"LkeyCGRect_height"] floatValue];
                        lLabel.frame = CGRectMake(rect_x,rect_y,rect_width,rect_height);
                        lLabel.text = [AttributeDic objectForKey:@"LkeyText"];
                        lLabel.textAlignment = [[AttributeDic objectForKey:@"LkeyAlignment"] intValue];
                        lLabel.backgroundColor = [UIColor grayColor];
                        [baseView addSubview:lLabel];
                        
                        break;
                    }
                    case 2:{
                        UITextField *lTextField = [[UITextField alloc]init];
                        CGFloat rect_x= [[AttributeDic objectForKey:@"TkeyCGRect_x"] floatValue];
                        CGFloat rect_y= [[AttributeDic objectForKey:@"TkeyCGRect_y"] floatValue];
                        CGFloat rect_width= [[AttributeDic objectForKey:@"TkeyCGRect_width"] floatValue];
                        CGFloat rect_height= [[AttributeDic objectForKey:@"TkeyCGRect_height"] floatValue];
                        lTextField.frame = CGRectMake(rect_x,rect_y,rect_width,rect_height);
                        lTextField.backgroundColor = [UIColor blueColor];
                        [lTextField addTarget:self action:@selector(textClick) forControlEvents:UIControlEventEditingDidEndOnExit];
                        [baseView addSubview:lTextField];
                        
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
    
    NSArray *typeOfArray = @[@"button",@"label",@"textField"];//用于判断接受控键的类型
    NSMutableDictionary *lMdic = [[NSMutableDictionary alloc]init];
    NSInteger rows = [[wDictionary objectForKey:@"rowsOfType"] intValue];//纪录json描绘的有多少行
    NSInteger numOfitems;//纪录每一行需要布局的控键的个数
    for (int i= 0; i<rows-2; i++) {
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
                            [lMdic setObject:handlesOfType forKey:[NSString stringWithFormat:@"%d",numOfTag]];
                            //                        NSLog(@"/////////%@",lMdic);
                            break;
                        }
                        case 1:{
                            NSString *handlesOfType = [AttributeDic objectForKey:@"type"];
                            NSInteger numOfTag = [[AttributeDic objectForKey:@"LkeyOfTag"] intValue];
                            [lMdic setObject:handlesOfType forKey:[NSString stringWithFormat:@"%d",numOfTag]];
                            break;
                        }
                        case 2:{
                            NSString *handlesOfType = [AttributeDic objectForKey:@"type"];
                            NSInteger numOfTag = [[AttributeDic objectForKey:@"TkeyOfTag"] intValue];
                            [lMdic setObject:handlesOfType forKey:[NSString stringWithFormat:@"%d",numOfTag]];
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

-(void)textClick{
    //do any additional setup
    
}

@end
