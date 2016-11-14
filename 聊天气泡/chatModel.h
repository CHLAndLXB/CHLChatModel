//
//  chatModel.h
//  聊天气泡
//
//  Created by huochaihy on 16/10/14.
//  Copyright © 2016年 CHL. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
//定义枚举类型
typedef enum {
    MyMessageType=0,//自己的消息
    OtherMessage, //别人的消息
} MessageType;

@interface chatModel : NSObject

@property(nonatomic,copy)NSString * name;

@property(nonatomic,copy)NSString * iconUrl;

@property(nonatomic,copy)NSString * textString;

@property (nonatomic,assign) MessageType messageType;

@end


