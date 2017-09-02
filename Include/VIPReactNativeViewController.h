//
//  VIPHomeViewController.h
//  RNVIPCenter
//
//  Created by iqiyi on 17/8/31.
//  Copyright © 2017年 iqiyi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VIPReactNativeViewController : UIViewController

@property (nonatomic ,readonly ,copy) NSDictionary *params;

- (instancetype) initWithParameter:(NSDictionary *) params;

@end
