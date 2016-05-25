//
//  AppData.h
//  TestProject
//
//  Created by Yosemite on 5/25/16.
//  Copyright © 2016 Martin.Dimitrov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppData : NSObject

@property (strong, nonatomic) NSString *username;
@property (strong, nonatomic) NSString *password;

+ (AppData *)appData;
- (NSString *)getBaseUrl;
- (BOOL)wifiAvailable;

@end
