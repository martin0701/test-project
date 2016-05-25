//
//  AppData.m
//  TestProject
//
//  Created by Yosemite on 5/25/16.
//  Copyright © 2016 Martin.Dimitrov. All rights reserved.
//

#import "AppData.h"
#import <Reachability.h>

static AppData * instance;
static NSString * const BASEURL  = @"https://opx.cfapps.io/dashboarditems";

@implementation AppData
{
    NSUserDefaults * _userDefaults;
    Reachability *_reachability;
}

+ (AppData *)appData{
    static AppData *sharedMyAppData = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyAppData = [[self alloc] init];
    });
    return sharedMyAppData;
}

- (id)init{
    self = [super init];
    if (self){
        _userDefaults = [NSUserDefaults standardUserDefaults];
        _reachability = [Reachability reachabilityWithHostname:[self getBaseUrl]];
        [_reachability startNotifier];
    }
    return self;
}

- (NSString *)getBaseUrl{
    return BASEURL;
}

- (BOOL)wifiAvailable{
    
    Reachability *reachability = [Reachability reachabilityForInternetConnection];
    [reachability startNotifier];
    
    NetworkStatus status = [reachability currentReachabilityStatus];
    
    if(status == NotReachable)
    {
        //No internet
        return NO;
    }
    else if (status == ReachableViaWiFi)
    {
        //WiFi
        return YES;
    }
    else if (status == ReachableViaWWAN)
    {
        //3G
        return YES;
    }
    
    return NO;
}

@end
