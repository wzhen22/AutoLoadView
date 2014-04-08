//
//  ControlMapFJ.m
//  AutoLoadView
//
//  Created by 传晟 on 14-4-8.
//  Copyright (c) 2014年 传晟. All rights reserved.
//

#import "ControlMapFJ.h"
#import "CountString.h"

NSString *const kType = @"type";
NSString *const ktag  = @"BkeyOfTag";

NSString *const kColorRGBGreen = @"BkeyColorRGB_green";
NSString *const kColorRGBRed = @"BkeyColorRGB_red";
NSString *const kColorRGBBlue = @"BkeyColorRGB_blue";
NSString *const kColorRGB_alpha = @"BkeyColor_alpha";

NSString *const kCGRectX = @"BkeyCGRect_x";
NSString *const kCGRectY = @"BkeyCGRect_y";
NSString *const kCGRectWidth = @"BkeyCGRect_width";
NSString *const kCGRectheight = @"BkeyCGRect_height";



@interface ControlMapFJ ()
@property(nonatomic,strong)CountString *countSting;
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;
@end

@implementation ControlMapFJ
+(ControlMapFJ *)modelObjectWithDictionary:(NSDictionary *)dictionary{
    ControlMapFJ *interface = [[ControlMapFJ alloc]initWithDictionary:dictionary];
    return interface;
}
-(instancetype)initWithDictionary:(NSDictionary *)dictionary{
    self  = [super init];
    if (self && [dictionary isKindOfClass:[NSDictionary class]]) {
        _countSting = [[CountString alloc]init];
        
        self.type = [self objectOrNilForKey:kType fromDictionary:dictionary];
        self.tag = [self objectOrNilForKey:ktag fromDictionary:dictionary];
        NSString *xString = [_countSting getStatement:[self objectOrNilForKey:kCGRectX fromDictionary:dictionary]];
        CGFloat rect_x =[_countSting operatorString:xString];
        NSString *yString = [_countSting getStatement:[self objectOrNilForKey:kCGRectY fromDictionary:dictionary]];
        CGFloat rect_y =[_countSting operatorString:yString];
        NSString *wString = [_countSting getStatement:[self objectOrNilForKey:kCGRectWidth  fromDictionary:dictionary]];
        CGFloat rect_width =[_countSting operatorString:wString];
        NSString *hString = [_countSting getStatement:[self objectOrNilForKey:kCGRectheight  fromDictionary:dictionary]];
        CGFloat rect_height =[_countSting operatorString:hString];
        self.xPointOfRect = [NSString stringWithFormat:@"%f",rect_x];
        self.yPointOfRect = [NSString stringWithFormat:@"%f",rect_y];
        self.widthOfRect = [NSString stringWithFormat:@"%f",rect_width];
        self.heightOfRect = [NSString stringWithFormat:@"%f",rect_height];
        

        CGFloat fRGBred = [_countSting operatorString:[self objectOrNilForKey:kColorRGBRed fromDictionary:dictionary]];
        CGFloat fRGBgreen = [_countSting operatorString:[self objectOrNilForKey:kColorRGBGreen fromDictionary:dictionary]];
        CGFloat fRGBblue = [_countSting operatorString:[self objectOrNilForKey:kColorRGBBlue  fromDictionary:dictionary]];
        self.RGBRed = [NSString stringWithFormat:@"%f",fRGBred];
        self.RGBGreen = [NSString stringWithFormat:@"%f",fRGBgreen];
        self.RGBBlue = [NSString stringWithFormat:@"%f",fRGBblue];
        self.RGB_alpha = [self objectOrNilForKey:kColorRGB_alpha fromDictionary:dictionary];
    }
    return self;
}
- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.tag forKey:ktag];
    [mutableDict setValue:self.type forKey:kType];
    [mutableDict setValue:self.xPointOfRect forKey:kCGRectX];
    [mutableDict setValue:self.yPointOfRect forKey:kCGRectY];
    [mutableDict setValue:self.widthOfRect forKey:kCGRectWidth];
    [mutableDict setValue:self.heightOfRect forKey:kCGRectheight];
    [mutableDict setValue:self.RGBRed forKey:kColorRGBRed];
    [mutableDict setValue:self.RGBGreen forKey:kColorRGBGreen];
    [mutableDict setValue:self.RGBBlue forKey:kColorRGBBlue];
    [mutableDict setValue:self.RGB_alpha forKey:kColorRGB_alpha];
    
    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict
{
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}

@end
