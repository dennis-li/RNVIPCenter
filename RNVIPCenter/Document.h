//
//  Document.h
//  XMLDocumentGenerator
//
//  Created by lixu on 16/11/2.
//  Copyright © 2016年 lixu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Node.h"

@interface Document : NSObject

//版本
@property (nonatomic ,copy,readonly) NSString *version;

//编码
@property (nonatomic ,copy,readonly) NSString *encoding;

//文档根结点
@property (nonatomic ,readonly,strong) Node *root;

//指定构造方法
-(id)initWithVersion:(NSString *)version encoding:(NSString *)encoding root:(Node *)root NS_DESIGNATED_INITIALIZER;

//默认版本，编码
- (instancetype)initWithRoot:(Node *)root;

@end
