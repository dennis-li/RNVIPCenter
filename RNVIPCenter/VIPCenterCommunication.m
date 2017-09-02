//
//  RCTMethod.m
//  RNApp
//
//  Created by iqiyi on 17/8/5.
//  Copyright © 2017年 iqiyi. All rights reserved.
//

#import "VIPCenterCommunication.h"
#import <DLModulesCenter/DLModulesCenter.h>
#import "VIPHelper.h"

@interface VIPCenterCommunication ()

@property (nonatomic ,copy) NSMutableDictionary *successCallBack;

@property (nonatomic ,copy) NSMutableDictionary *failureCallBack;

@end

@implementation VIPCenterCommunication

- (instancetype) init
{
    self = [super init]; 
    
    
    
    return self;
}

RCT_EXPORT_MODULE();


RCT_EXPORT_METHOD(route:(NSData *) parameter success:(RCTResponseSenderBlock)success failure:(RCTResponseSenderBlock) failure)
{
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:parameter options:NSJSONReadingAllowFragments error:nil];
    NSString *action = [[dict objectForKey:@"action"] description];
    NSDictionary *params = [dict objectForKey:@"params"];
    
    if (!action) {
        return;
    }
    
    if (success) {
        self.successCallBack[action] = success;
    }
    
    if (failure) {
        self.failureCallBack[action] = success;
    }
    
    
    if ([action isEqualToString:@"quit"]) {
        
        [self quitVIPCenterModule];

        
    } else if ([action isEqualToString:@"openMall"]) {
        
        [self openMallWithParameter:params];
        
    } else if (failure) {
        
        failure(nil);
        
    } else if (success) {
        
        success(nil);
        
    }
    
}

- (void) quitVIPCenterModule
{
    VIPHelper *helper = [VIPHelper sharedInstance];
    UIViewController *vc = helper.reactNativeViewController;
    
    [vc dismissViewControllerAnimated:YES completion:^{
        [helper quitVIPCenterModuleWithParameters:nil error:nil];
    }];
}

- (void) openMallWithParameter:(NSDictionary *) params
{
    VIPHelper *helper = [VIPHelper sharedInstance];
    
    NSDictionary *localParams = @{@"rootVC":helper.reactNativeViewController};
    
    [helper openOtherModuleWithOriginalParameter:params localParams:localParams closeCallBack:^(DLModuleCallbackData *callbackData) {
        NSLog(@"quit mall");
    }];
}

- (NSMutableDictionary *) successCallBack
{
    if (!_successCallBack) {
        _successCallBack = [NSMutableDictionary dictionary];
    }
    
    return _successCallBack;
}

- (NSMutableDictionary *) failureCallBack
{
    if (!_failureCallBack) {
        _failureCallBack = [NSMutableDictionary dictionary];
    }
    
    return _failureCallBack;
}

@end
