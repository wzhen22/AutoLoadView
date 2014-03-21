//
//  wDynamicLayout.h
//  AutoLoodViewDemo
//
//  Created by 传晟 on 14-3-18.
//  Copyright (c) 2014年 传晟. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HeaderForMacro.h"

@interface wDynamicLayout : NSObject
@property(nonatomic,retain)NSMutableDictionary *items;
//@property(nonatomic,assign) NSInteger numOfItems;


-(void)loadItemsForGroup:(NSDictionary *)dictionary AndBaseView:(id)baseView;
-(id) viewOfItems:(NSDictionary *)array andTag:(NSInteger )num;
-(NSDictionary *)getItemsOfGroup:(NSDictionary *)wDictionary;//获取每个控键的类型和tag值


@end
