//
//  DashboardVC.m
//  TestProject
//
//  Created by Yosemite on 5/25/16.
//  Copyright © 2016 Martin.Dimitrov. All rights reserved.
//

#import "DashboardVC.h"

@implementation DashboardVC

- (void)viewDidLoad{
    
    [super viewDidLoad];
    
    [SVProgressHUD show];
    [self loadKPIData];
}

- (void)loadKPIData{
    
    [TestAPI getKPIinfoWithUsername:[AppData appData].username
                           password:[AppData appData].password
                 andCompletionBlock:^(BOOL isResult, id responseObj)
    {
        [SVProgressHUD dismiss];
        if (isResult) {
            self.arr_KPIData = [self arrFromJSON:responseObj];
            [self.tableView reloadData];
        }
        else{
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:loadKPIDataError
                                                                message:responseObj
                                                               delegate:self
                                                      cancelButtonTitle:@"Ok"
                                                      otherButtonTitles:nil];
            [alertView show];
            return;
        }
    }];
}

- (NSMutableArray*)arrFromJSON:(id)responseArr{
    
    NSMutableArray *arrResult = [[NSMutableArray alloc] init];
    
    for (NSDictionary *json in responseArr) {
        KPIData *element = [KPIData create];
        element.label = json[key_label];
        element.code = json[key_code];
        
        ////////////////
        element.kpiValue.amountInAggregationCurrency.unit = json[key_kpiValue][key_amountInAggregationCurrency][key_unit];
        element.kpiValue.amountInAggregationCurrency.value = [json[key_kpiValue][key_amountInAggregationCurrency][key_value] floatValue];
        element.kpiValue.timePeriod.sliceUnit = json[key_kpiValue][key_timePeriod][key_sliceUnit];
        element.kpiValue.timePeriod.sliceCount = [json[key_kpiValue][key_timePeriod][key_sliceCount] integerValue];
        element.kpiValue.timePeriod.sliceUnitCount = [json[key_kpiValue][key_timePeriod][key_sliceUnitCount] integerValue];
        
        ///////////////
        element.surroundingPeriodData.timePeriod.periodEnd = json[key_surroundingPeriodData][key_timePeriod][key_periodEnd];
        element.surroundingPeriodData.timePeriod.sliceUnit = json[key_surroundingPeriodData][key_timePeriod][key_periodEnd];
        element.surroundingPeriodData.timePeriod.sliceUnitCount = [json[key_surroundingPeriodData][key_timePeriod][key_sliceUnitCount] integerValue];
        element.surroundingPeriodData.timePeriod.sliceCount = [json[key_surroundingPeriodData][key_timePeriod][key_sliceCount] integerValue];
        
        ///////////////
        element.surroundingPeriodData.minValue.amountInAggregationCurrency.unit = json[key_surroundingPeriodData][key_minValue][key_amountInAggregationCurrency][key_unit];
        element.surroundingPeriodData.minValue.amountInAggregationCurrency.value = [json[key_surroundingPeriodData][key_minValue][key_amountInAggregationCurrency][key_value] floatValue];
        element.surroundingPeriodData.minValue.timePeriod.periodEnd = json[key_surroundingPeriodData][key_minValue][key_timePeriod][key_periodEnd];
        element.surroundingPeriodData.minValue.timePeriod.sliceUnit = json[key_surroundingPeriodData][key_minValue][key_timePeriod][key_sliceUnit];
        element.surroundingPeriodData.minValue.timePeriod.sliceUnitCount = [json[key_surroundingPeriodData][key_minValue][key_timePeriod][key_sliceUnitCount] integerValue];
        element.surroundingPeriodData.minValue.timePeriod.sliceCount = [json[key_surroundingPeriodData][key_minValue][key_timePeriod][key_sliceCount] integerValue];
        
        ///////////////
        element.surroundingPeriodData.maxValue.amountInAggregationCurrency.unit = json[key_surroundingPeriodData][key_maxValue][key_amountInAggregationCurrency][key_unit];
        element.surroundingPeriodData.maxValue.amountInAggregationCurrency.value = [json[key_surroundingPeriodData][key_maxValue][key_amountInAggregationCurrency][key_value] floatValue];
        element.surroundingPeriodData.maxValue.timePeriod.periodEnd = json[key_surroundingPeriodData][key_maxValue][key_timePeriod][key_periodEnd];
        element.surroundingPeriodData.maxValue.timePeriod.sliceUnit = json[key_surroundingPeriodData][key_maxValue][key_timePeriod][key_sliceUnit];
        element.surroundingPeriodData.maxValue.timePeriod.sliceUnitCount = [json[key_surroundingPeriodData][key_maxValue][key_timePeriod][key_sliceUnitCount] integerValue];
        element.surroundingPeriodData.maxValue.timePeriod.sliceCount = [json[key_surroundingPeriodData][key_maxValue][key_timePeriod][key_sliceCount] integerValue];
        
        ///////////////
        element.surroundingPeriodData.avgValue.amountInAggregationCurrency.unit = json[key_surroundingPeriodData][key_avgValue][key_amountInAggregationCurrency][key_unit];
        element.surroundingPeriodData.avgValue.amountInAggregationCurrency.value = [json[key_surroundingPeriodData][key_avgValue][key_amountInAggregationCurrency][key_value] floatValue];
        
        [arrResult addObject:element];
    }
    
    return arrResult;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return dashboardCellHeight;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.arr_KPIData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellID = dashboardCellID;
    DashboardCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    // Configure the cell...
    if (cell == nil) {
        cell = [[DashboardCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    cell.cellData = [self.arr_KPIData objectAtIndex:indexPath.row];
    [cell configureCell];
    
    return cell;
}

@end
