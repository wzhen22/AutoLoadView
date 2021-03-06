//
//  ControlMapFJ.h
//  AutoLoadView
//
//  Created by 传晟 on 14-4-8.
//  Copyright (c) 2014年 传晟. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ControlMapFJ : NSObject

@property(nonatomic,strong) NSString *type;
@property(nonatomic,strong) NSString *tag;
//定制背景颜色
@property(nonatomic,strong) NSString *RGBGreen;
@property(nonatomic,strong) NSString *RGBBlue;
@property(nonatomic,strong) NSString *RGBRed;
@property(nonatomic,strong) NSString *RGB_alpha;
//定制控件的frame
@property(nonatomic,strong) NSString *heightOfRect;
@property(nonatomic,strong) NSString *widthOfRect;
@property(nonatomic,strong) NSString *xPointOfRect;
@property(nonatomic,strong) NSString *yPointOfRect;


//@property(nonatomic,strong) NSString *RGB_alpha;

+(ControlMapFJ *)modelObjectWithDictionary:(NSDictionary *)dictionary;
-(instancetype)initWithDictionary:(NSDictionary *)dictionary;
-(NSDictionary *)dictionaryRepresentation;

@end
