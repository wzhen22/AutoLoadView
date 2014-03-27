//
//  customView.h
//  AutoLoodViewDemo
//
//  Created by 传晟 on 14-3-13.
//  Copyright (c) 2014年 传晟. All rights reserved.
//

#import <UIKit/UIKit.h>
@class customView;
typedef void (^Myblock) (customView *);
@interface customView : UIView
@property(nonatomic,copy )Myblock customViewBlock;


-(void)setimageWithView:(Myblock) block;
@end
