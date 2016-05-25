//
//  KPIValue.m
//  TestProject
//
//  Created by Yosemite on 5/25/16.
//  Copyright © 2016 Martin.Dimitrov. All rights reserved.
//

#import "KPIValue.h"

@implementation KPIValue

+ (instancetype)create{
    KPIValue *element = [KPIValue alloc];
    
    element.timePeriod = [TimePeriod create];
    element.amountInAggregationCurrency = [AmountInAggregationCurrency create];
    
    return element;
}

@end
