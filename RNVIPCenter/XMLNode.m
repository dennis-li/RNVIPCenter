//
//  XMLNode.m
//  XMLDocumentGenerator
//
//  Created by lixu on 16/11/1.
//  Copyright © 2016年 lixu. All rights reserved.
//

#import "XMLNode.h"

@interface XMLNode ()

@end

@implementation XMLNode

//构造方法
-(id)initWithName:(NSString *)name
{
    self = [super initWithName:name];
    if (self) {
        
    }
    return self;
}

//打印当前结点，及其后代结点
-(void)printCurrentXMLNodes
{
    NSLog(@"%@",[self currentXMLNodes]);
}

//当前结点，及其后代结点转换成字符串
-(NSString *)currentXMLNodes
{
    NSMutableString *currentNodeString = [[NSMutableString alloc] init];
    
    //结点名称
    [currentNodeString appendString:[NSString stringWithFormat:@"<%@",self.name]];
    
    //属性个数
    for (NSString *key in self.propertyDictionary) {
        XMLPropertyNode *property = [self.propertyDictionary objectForKey:key];
        [currentNodeString appendString:[NSString stringWithFormat:@" %@=\"%@\"",property.name,property.value]];
    }
    
    
    //是否有文本，有则换行
    NSString *str = self.text ? @"" : @"\n";
    [currentNodeString appendString:[NSString stringWithFormat:@">%@",str]];
    
    //文本
    if (self.text) {
        [currentNodeString appendString:[NSString stringWithFormat:@"%@",self.text]];
    }
    
    //子结点个数
    NSInteger childNodesCount = [self.children count];
    if (childNodesCount) {
        for (NSInteger i = 0; i < childNodesCount; i++) {
            //子结点转换为字符串
            NSString *childString = [[self.children objectAtIndex:i] currentXMLNodes];
            [currentNodeString appendString:childString];
        }
    }
    
    //当前结点，及其后代结点转换成字符串
    [currentNodeString appendString:[NSString stringWithFormat:@"</%@>\n",self.name]];
    return currentNodeString;
}

@end
