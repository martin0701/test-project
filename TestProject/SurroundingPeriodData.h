//
//  SurroundingPeriodData.h
//  TestProject
//
//  Created by Yosemite on 5/25/16.
//  Copyright © 2016 Martin.Dimitrov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TimePeriod.h"
#import "KPIValue.h"

@interface SurroundingPeriodData : NSObject

@property (strong, nonatomic) TimePeriod *timePeriod;
@property (strong, nonatomic) KPIValue *minValue;
@property (strong, nonatomic) KPIValue *maxValue;
@property (strong, nonatomic) KPIValue *avgValue;

+ (instancetype)create;

@end
