//
//  VIPHomeViewController.m
//  RNVIPCenter
//
//  Created by iqiyi on 17/8/31.
//  Copyright © 2017年 iqiyi. All rights reserved.
//

#import "VIPReactNativeViewController.h"
#import "RCTRootView.h"

@interface VIPReactNativeViewController ()

@end

@implementation VIPReactNativeViewController

- (instancetype) initWithParameter:(NSDictionary *) params
{
    self  = [super init];
    
    if (self) {
        
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSURL *jsCodeLocation = [NSURL
                             URLWithString:@"http://localhost:8081/index.ios.bundle?platform=ios"];
    
    RCTRootView *rootView =
    [[RCTRootView alloc] initWithBundleURL : jsCodeLocation
                         moduleName        : @"RNApp"
                         initialProperties :
     @{
       @"title" : @"购买会员",
       @"subTitle":@"购买一个月",
       @"from":@"商城"
       }
                          launchOptions    : nil];
    
    self.view = rootView;
    
}



@end
