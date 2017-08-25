//
//  Document.m
//  XMLDocumentGenerator
//
//  Created by lixu on 16/11/2.
//  Copyright © 2016年 lixu. All rights reserved.
//

#import "Document.h"

@interface Document ()

//版本
@property (nonatomic ,readwrite,copy) NSString *version;

//编码
@property (nonatomic ,readwrite,copy) NSString *encoding;

//文档根结点
@property (nonatomic ,readwrite,strong) Node *root;

@end

@implementation Document

//快捷构造方法
+ (instancetype)Document
{
    return [[[self class] alloc] init];
}

//指定构造方法
- (instancetype)initWithVersion:(NSString *)version
                      encoding:(NSString *)encoding
                          root:(Node *)root
{
    self = [super init];
    if (self) {
        _version = [version copy];
        _encoding = [encoding copy];
        _root = root;
    }
    return self;
}

//默认版本，编码
- (instancetype)initWithRoot:(Node *)root
{
    return [self initWithVersion:@"1.0" encoding:@"UTF-8" root:root];
}

//重写父类构造方法
- (instancetype)init
{
    Node *root = [[Node alloc] initWithName:@"root"];
    return [self initWithRoot:root];
}

@end
