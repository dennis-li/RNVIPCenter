//
//  VIPCenter.m
//  RNVIPCenter
//
//  Created by iqiyi on 17/8/31.
//  Copyright © 2017年 iqiyi. All rights reserved.
//

#import "VIPCenter.h"
#import "VIPHelper.h"

@implementation VIPCenter

+ (void) load
{
    [DLModulesManager registerByModuleID:@"VIPCenter" className:NSStringFromClass([self class])];
}

+ (void) launchWithParam:(DLModuleParameter *)param
{
    NSDictionary *originalParams = param.originalParams;
    if (![originalParams isKindOfClass:[NSDictionary class]]) {
        return;
    }
    
    NSString *subID = [[originalParams objectForKey:@"subID"] description];
    
    if ([subID isEqualToString:@"main"]) {
        
        [[VIPHelper sharedInstance] showMainPageWithParameter:param];
        
    } else if ([subID isEqualToString:@"detail"]) {
        
        [[VIPHelper sharedInstance] showDetailPageWithParameter:param];
        
    }
}

@end
