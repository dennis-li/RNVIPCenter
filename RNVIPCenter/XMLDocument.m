//
//  XMLDocument.m
//  XMLDocumentGenerator
//
//  Created by lixu on 16/11/2.
//  Copyright © 2016年 lixu. All rights reserved.
//

#import "XMLDocument.h"


@implementation XMLDocument

//指定构造方法
-(instancetype)initWithVersion:(NSString *)version encoding:(NSString *)encoding root:(Node *)root
{
    self = [super initWithVersion:version encoding:encoding root:root];
    
    if (self) {
        
    }
    return self;
}

//默认版本，编码
- (instancetype)initWithRoot:(Node *)root
{
    return [self initWithVersion:@"1.0.1" encoding:@"UTF-8" root:root];
}

//XML文档转换为字符串
-(NSString *)XMLDocumentString
{
    XMLNode *root = (XMLNode *)self.root;
    NSString *rootString = [root currentXMLNodes];
    
    NSString *xmlHeadString = [NSString stringWithFormat:@"\n<?xml version=\"%@\" encoding=\"%@\"?>\n",self.version,self.encoding];
    return [xmlHeadString stringByAppendingString:rootString];
}


@end
