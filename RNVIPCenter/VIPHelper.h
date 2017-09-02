//
//  VIPHelper.h
//  RNVIPCenter
//
//  Created by iqiyi on 17/8/31.
//  Copyright © 2017年 iqiyi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <DLModulesCenter/DLModulesCenter.h>
#import "VIPReactNativeViewController.h"

@class UIViewController;
@interface VIPHelper : NSObject

@property (nonatomic ,weak) VIPReactNativeViewController *reactNativeViewController;

@property (nonatomic , weak) DLModuleParameter *params;

+ (instancetype) sharedInstance;

- (void) showMainPageWithParameter:(DLModuleParameter *) params;

- (void) showDetailPageWithParameter:(DLModuleParameter *) params;

- (void) quitVIPCenterModuleWithParameters:(NSDictionary *) data error:(NSError *) callbackError;

- (void) openOtherModuleWithOriginalParameter:(NSDictionary *) originalParams
                                  localParams:(NSDictionary *) localParams
                                closeCallBack:(DLModuleClose) closeCallBack;

@end
