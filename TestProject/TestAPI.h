//
//  TestAPI.h
//  TestProject
//
//  Created by Yosemite on 5/25/16.
//  Copyright © 2016 Martin.Dimitrov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TestAPI : NSObject

+ (void) getKPIinfoWithUsername:(NSString *)username
                       password:(NSString *)password
             andCompletionBlock:(void(^)(BOOL, id))completionBlock;

@end
