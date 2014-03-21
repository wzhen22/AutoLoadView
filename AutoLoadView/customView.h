//
//  customView.h
//  AutoLoodViewDemo
//
//  Created by 传晟 on 14-3-13.
//  Copyright (c) 2014年 传晟. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^Myblock) (void);
@interface customView : UIView
@property(nonatomic,copy )Myblock myblock;


-(void)setimageWithView:(Myblock) block;
@end
