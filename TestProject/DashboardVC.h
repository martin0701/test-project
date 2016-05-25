//
//  DashboardVC.h
//  TestProject
//
//  Created by Yosemite on 5/25/16.
//  Copyright © 2016 Martin.Dimitrov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SVProgressHUD.h>

#import "KPIData.h"
#import "AppData.h"
#import "TestAPI.h"
#import "DashboardCell.h"

@interface DashboardVC : UITableViewController

@property (nonatomic, strong) NSMutableArray *arr_KPIData;

@end
