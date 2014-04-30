//
//  customButton.h
//  AutoLoodViewDemo
//
//  Created by 传晟 on 14-3-12.
//  Copyright (c) 2014年 传晟. All rights reserved.
//

#import <UIKit/UIKit.h>
@class customButton;
typedef void (^MyBlock)(customButton *);
@interface customButton : UIButton


@property(nonatomic,strong) MyBlock myblock;
@property(nonatomic,assign) NSInteger numOfType;



@end
