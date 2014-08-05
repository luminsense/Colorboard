//
//  LNGColorDescription.m
//  Colorboard
//
//  Created by Lumi on 14-8-5.
//  Copyright (c) 2014年 LumiNg. All rights reserved.
//

#import "LNGColorDescription.h"

@implementation LNGColorDescription

- (instancetype)init
{
    self = [super init];
    if (self) {
        _color = [UIColor colorWithRed:1 green:1 blue:1 alpha:1];
        _name = @"White";
    }
    return self;
}

@end
