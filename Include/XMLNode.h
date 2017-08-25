//
//  XMLNode.h
//  XMLDocumentGenerator
//
//  Created by lixu on 16/11/1.
//  Copyright © 2016年 lixu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Node.h"

//XML结点
@interface XMLNode : Node

//打印当前结点，及其后代结点
-(void)printCurrentXMLNodes;

//当前结点，及其后代结点转换成字符串
-(NSString *)currentXMLNodes;

@end
