//
//  ChatTableViewCell.h
//  聊天气泡
//
//  Created by huochaihy on 16/10/14.
//  Copyright © 2016年 CHL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "chatModel.h"
@interface ChatTableViewCell : UITableViewCell


- (void)refreshCell:(chatModel *)model;


@property (nonatomic,assign)CGFloat cellHeight;

@end
