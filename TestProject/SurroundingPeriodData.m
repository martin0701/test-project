//
//  SurroundingPeriodData.m
//  TestProject
//
//  Created by Yosemite on 5/25/16.
//  Copyright © 2016 Martin.Dimitrov. All rights reserved.
//

#import "SurroundingPeriodData.h"

@implementation SurroundingPeriodData

+ (instancetype)create{
    
    SurroundingPeriodData *element = [SurroundingPeriodData alloc];
    
    element.timePeriod = [TimePeriod create];
    element.minValue = [KPIValue create];
    element.maxValue = [KPIValue create];
    element.avgValue = [KPIValue create];

    return element;
}

@end
