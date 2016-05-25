//
//  AmountInAggregationCurrency.m
//  TestProject
//
//  Created by Yosemite on 5/25/16.
//  Copyright © 2016 Martin.Dimitrov. All rights reserved.
//

#import "AmountInAggregationCurrency.h"

@implementation AmountInAggregationCurrency

+ (instancetype)create{
    
    AmountInAggregationCurrency *element = [AmountInAggregationCurrency alloc];
    
    element.unit = @"";
    element.value = 0;
    
    return element;
}

@end
