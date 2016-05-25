//
//  TimePeriod.m
//  TestProject
//
//  Created by Yosemite on 5/25/16.
//  Copyright © 2016 Martin.Dimitrov. All rights reserved.
//

#import "TimePeriod.h"

@implementation TimePeriod

+ (instancetype)create{

    TimePeriod *element = [TimePeriod alloc];
    
    element.periodEnd = @"";
    element.sliceUnit = @"";
    element.sliceUnitCount = 0;
    element.sliceCount = 0;
    
    return element;
}

@end
