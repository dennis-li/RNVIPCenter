//
//  VIPHelper.m
//  RNVIPCenter
//
//  Created by iqiyi on 17/8/31.
//  Copyright © 2017年 iqiyi. All rights reserved.
//

#import "VIPHelper.h"
#import "DetailViewController.h"

@implementation VIPHelper

+ (instancetype) sharedInstance
{
    static dispatch_once_t token;
    static VIPHelper *helper = nil;
    dispatch_once(&token, ^{
        helper = [[VIPHelper alloc] init];
        
    });
    return helper;
}

- (void) showMainPageWithParameter:(DLModuleParameter *) params
{
    
    NSDictionary *localParams = params.localParams;
    
    if (![localParams isKindOfClass:[NSDictionary class]]) {
        return;
    }
    
    UIViewController *rootVC = [localParams objectForKey:@"rootVC"];
    if (![rootVC isKindOfClass:[UIViewController class]]) {
        return;
    }
    
    VIPReactNativeViewController *reactNativeVC = [[VIPReactNativeViewController alloc] initWithParameter:params.originalParams];
    [VIPHelper sharedInstance].reactNativeViewController = reactNativeVC;
    [VIPHelper sharedInstance].params = params;
    
    [rootVC presentViewController:reactNativeVC animated:YES completion:^{
        
    }];
    
}

- (void) showDetailPageWithParameter:(DLModuleParameter *) params
{
    NSDictionary *localParams = params.localParams;
    
    if (![localParams isKindOfClass:[NSDictionary class]]) {
        return;
    }
    
    UIViewController *rootVC = [localParams objectForKey:@"rootVC"];
    if (![rootVC isKindOfClass:[UIViewController class]]) {
        return;
    }
    
    DetailViewController *detailVC = [[DetailViewController alloc] initWithParameter:params.originalParams];
    [VIPHelper sharedInstance].params = params;
    
    [rootVC presentViewController:detailVC animated:YES completion:^{
        
    }];
}

- (void) quitVIPCenterModuleWithParameters:(NSDictionary *) data error:(NSError *) callbackError
{
    VIPHelper *helper = [VIPHelper sharedInstance];
    
    DLModuleCallbackData *callbackData = [[DLModuleCallbackData alloc] init];
    callbackData.data = data;
    callbackData.error = callbackError;
    
    if (helper.params.closeCallBack) {
        helper.params.closeCallBack(callbackData);
    }
}

- (void) openOtherModuleWithOriginalParameter:(NSDictionary *) originalParams
                                  localParams:(NSDictionary *)localParams
                                closeCallBack:(DLModuleClose)closeCallBack
{
    DLModuleParameter *moduleParams = [[DLModuleParameter alloc] init];
    moduleParams.originalParams = originalParams;
    moduleParams.localParams = localParams;
    moduleParams.closeCallBack = closeCallBack;
    
    [DLModulesManager openModuleWithParams:moduleParams];
}

@end
