//
//  KPIValue.h
//  TestProject
//
//  Created by Yosemite on 5/25/16.
//  Copyright © 2016 Martin.Dimitrov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TimePeriod.h"
#import "AmountInAggregationCurrency.h"

@interface KPIValue : NSObject

@property (strong, nonatomic) TimePeriod *timePeriod;
@property (strong, nonatomic) AmountInAggregationCurrency *amountInAggregationCurrency;

+ (instancetype)create;

@end
