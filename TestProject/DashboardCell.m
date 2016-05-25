//
//  DashboardCell.m
//  TestProject
//
//  Created by Yosemite on 5/25/16.
//  Copyright © 2016 Martin.Dimitrov. All rights reserved.
//

#import "DashboardCell.h"

@implementation DashboardCell

- (void)configureCell{
    float min = self.cellData.surroundingPeriodData.minValue.amountInAggregationCurrency.value;
    float max = self.cellData.surroundingPeriodData.maxValue.amountInAggregationCurrency.value;
    float avg = self.cellData.surroundingPeriodData.avgValue.amountInAggregationCurrency.value;
    
    self.lbl_title.text = self.cellData.label;
    self.lbl_timePeriod.text = [NSString stringWithFormat:@"last %ld %@s", (long)self.cellData.kpiValue.timePeriod.sliceUnitCount,
                                                                           self.cellData.kpiValue.timePeriod.sliceUnit];
    self.lbl_KPIValue.text = [NSString stringWithFormat:@"Value: %ld %@", (long)self.cellData.kpiValue.amountInAggregationCurrency.value,
                                                                           self.cellData.kpiValue.amountInAggregationCurrency.unit];
    self.lbl_minValue.text = [NSString stringWithFormat:@"%ld", (long)min];
    self.lbl_maxValue.text = [NSString stringWithFormat:@"%ld", (long)max];
    self.lbl_avgValue.text = [NSString stringWithFormat:@"%ld", (long)avg];
    
    self.sld_avgValue.value = (avg - min) / (max - min);
    self.lblAvgPos.constant = self.sld_avgValue.frame.origin.x + self.sld_avgValue.frame.size.width * self.sld_avgValue.value - self.lbl_avgValue.frame.size.width / 2;
}

@end
