//
//  XMLPropertyNode.h
//  XMLDocumentGenerator
//
//  Created by lixu on 16/11/1.
//  Copyright © 2016年 lixu. All rights reserved.
//

#import <Foundation/Foundation.h>

//属性结点
@interface XMLPropertyNode : NSObject

//属性的名字
@property (nonatomic ,strong) NSString *name;

//属性值
@property (nonatomic ,strong) NSString *value;
@end
