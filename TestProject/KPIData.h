//
//  KPIData.h
//  TestProject
//
//  Created by Yosemite on 5/25/16.
//  Copyright © 2016 Martin.Dimitrov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KPIValue.h"
#import "SurroundingPeriodData.h"

@interface KPIData : NSObject

@property (strong, nonatomic) NSString *code;
@property (strong, nonatomic) NSString *label;
@property (strong, nonatomic) KPIValue *kpiValue;
@property (strong, nonatomic) SurroundingPeriodData *surroundingPeriodData;

+ (instancetype)create;

@end
