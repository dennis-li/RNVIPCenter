//
//  Node.h
//  XMLDocumentGenerator
//
//  Created by lixu on 16/11/2.
//  Copyright © 2016年 lixu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XMLPropertyNode.h"

@interface Node : NSObject

//文本结点
@property (nonatomic ,strong) NSString *text;

//构造方法
-(id)initWithName:(NSString *)name;

//父结点
@property (nonatomic ,weak) Node *parent;

//获取结点名字
-(NSString *)name;

//添加子结点
-(void)addChildXMLNode:(Node *)child;

//删除子结点
-(void)removeChildXMLNode:(Node *)child;

//获取所有子结点对象
-(NSMutableArray *)children;

//获取父结点
-(Node *)parentXMLNode;

//添加属性
-(void)addXMLProperty:(XMLPropertyNode *)property;

//读取属性
-(XMLPropertyNode *)readPropertyWithName:(NSString *)propertyName;

//获取所有属性
-(NSMutableDictionary *)propertyDictionary;

//删除属性
-(void)removeXMLProperty:(NSString *)key;

@end
