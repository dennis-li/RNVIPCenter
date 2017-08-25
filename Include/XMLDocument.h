//
//  XMLDocument.h
//  XMLDocumentGenerator
//
//  Created by lixu on 16/11/2.
//  Copyright © 2016年 lixu. All rights reserved.
//

#import "Document.h"
#import "XMLNode.h"

@interface XMLDocument : Document

//指定构造方法
-(instancetype)initWithVersion:(NSString *)version encoding:(NSString *)encoding root:(Node *)root NS_DESIGNATED_INITIALIZER;

//XML文档转换为字符串
-(NSString *)XMLDocumentString;

@end
