//
//  AmountInAggregationCurrency.h
//  TestProject
//
//  Created by Yosemite on 5/25/16.
//  Copyright © 2016 Martin.Dimitrov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AmountInAggregationCurrency : NSObject

@property (strong, nonatomic) NSString *unit;
@property (nonatomic) float value;

+ (instancetype)create;

@end
