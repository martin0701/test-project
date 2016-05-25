//
//  KPIData.m
//  TestProject
//
//  Created by Yosemite on 5/25/16.
//  Copyright © 2016 Martin.Dimitrov. All rights reserved.
//

#import "KPIData.h"

@implementation KPIData

+ (instancetype)create{
    
    KPIData *element = [[KPIData alloc] init];
    
    element.code = @"";
    element.label = @"";
    element.kpiValue = [KPIValue create];
    element.surroundingPeriodData = [SurroundingPeriodData create];
    
    return element;
}

@end
