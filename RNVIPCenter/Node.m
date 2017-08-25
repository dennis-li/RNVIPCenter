//
//  Node.m
//  XMLDocumentGenerator
//
//  Created by lixu on 16/11/2.
//  Copyright © 2016年 lixu. All rights reserved.
//

#import "Node.h"

@interface Node ()

//子结点
@property (nonatomic ,strong) NSMutableArray *children;

//存放结点属性的字典key为属性名称
@property (nonatomic ,strong) NSMutableDictionary *propertyDictionary;

//结点名称
@property (nonatomic ,strong) NSString *name;

@end

@implementation Node

//构造方法
-(id)initWithName:(NSString *)name
{
    self = [super init];
    if (self) {
        if (name) {
            _name = name;
        } else {
            return nil;
        }
    }
    return self;
}

-(NSString *)name
{
    return _name;
}

//懒加载子结点数组
-(NSMutableArray *)children
{
    if (!_children) {
        _children = [[NSMutableArray alloc] init];
    }
    return _children;
}

//懒加载属性字典
-(NSMutableDictionary *)propertyDictionary
{
    if (!_propertyDictionary) {
        _propertyDictionary = [[NSMutableDictionary alloc] init];
    }
    return _propertyDictionary;
}

//添加子结点
-(void)addChildXMLNode:(Node *)child
{
    if (child) {
        child.parent = self;
        [self.children addObject:child];
    }
}

//删除子结点
-(void)removeChildXMLNode:(Node *)child
{
    
    if (child && [self.children containsObject:child]) {
        [self.children removeObject:child];
    }
}

//获取父结点
-(Node *)parentXMLNode
{
    Node *parent = nil;
    if (self.parent) {
        parent = self.parent;
    }
    return parent;
}

//添加属性
-(void)addXMLProperty:(XMLPropertyNode *)property
{
    if (property) {
        [self.propertyDictionary setObject:property forKey:property.name];
    }
}

//读取属性
-(XMLPropertyNode *)readPropertyWithName:(NSString *)propertyName
{
    return [self.propertyDictionary objectForKey:propertyName];
}

//删除属性
-(void)removeXMLProperty:(NSString *)key
{
    if (key && [self.propertyDictionary objectForKey:key]) {
        [self.propertyDictionary removeObjectForKey:key];
    }
}

@end
