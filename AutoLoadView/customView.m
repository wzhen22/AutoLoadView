//
//  customView.m
//  AutoLoodViewDemo
//
//  Created by 传晟 on 14-3-13.
//  Copyright (c) 2014年 传晟. All rights reserved.
//

#import "customView.h"

@implementation customView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void)setimageWithView:(Myblock)block{
    self.customViewBlock = block;
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    self.customViewBlock(self);
    
//    NSLog(@"hello");
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
