//
//  ChatTableViewCell.m
//  聊天气泡
//
//  Created by huochaihy on 16/10/14.
//  Copyright © 2016年 CHL. All rights reserved.
//

#import "ChatTableViewCell.h"
#import "chatModel.h"


@interface ChatTableViewCell ()

//名字
@property(nonatomic,strong)UILabel * nameLabel;
//头像
@property(nonatomic,strong)UIImageView * iconImageView;
//背景
@property(nonatomic,strong)UIImageView * backImageView;
//文字
@property(nonatomic,strong)UILabel * textlabel;



@end
@implementation ChatTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        self.iconImageView = [[UIImageView alloc]init];
        self.iconImageView.userInteractionEnabled = YES;
        
        self.nameLabel = [[UILabel alloc]init];
        self.nameLabel.font = [UIFont systemFontOfSize:12];
        
        //    创建气泡
        self.backImageView = [[UIImageView alloc]init];
        
        [self.contentView addSubview:self.iconImageView];
        [self.contentView addSubview:self.nameLabel];
        [self.contentView addSubview:self.backImageView];
       
        
        self.textlabel = [[UILabel alloc]init];
        self.textlabel.numberOfLines = 0;
        self.textlabel.font = [UIFont systemFontOfSize:17.0f];
        
        [self.backImageView addSubview:self.textlabel];
    }
    return self;
}
- (void)awakeFromNib {
    // Initialization code
    
}

//计算文本size
-(CGSize)sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize textString:(NSString *)textString
{
    NSDictionary *attrs = @{NSFontAttributeName : font};
    return [textString boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
}

- (void)refreshCell:(chatModel *)model
{
//    获取文本高度
    CGSize  size = [self sizeWithFont:[UIFont systemFontOfSize:17.0f] maxSize:CGSizeMake(200, 10000) textString:model.textString];
    
    self.nameLabel.text = model.name;
    

    UIImage * image = nil;
    if (model.messageType == 0) {
//        自己的 在右边
        self.iconImageView.image = [UIImage imageNamed:@"me.jpg"];
        self.iconImageView.frame = CGRectMake([UIScreen mainScreen].bounds.size.width-8-22, 8, 22, 22);
        self.nameLabel.frame = CGRectMake(CGRectGetMinX(self.iconImageView.frame) - 8-22, 8, 200, 12);
        self.backImageView.frame = CGRectMake(self.iconImageView.frame.origin.x-13-size.width-20, 23, size.width+20, size.height+20);
        image = [UIImage imageNamed:@"bubbleMine"];
    }else{
//        别人的 在左边
        self.iconImageView.image = [UIImage imageNamed:@"other.jpg"];
//
        self.iconImageView.frame = CGRectMake(8, 8, 22, 22);
        self.nameLabel.frame = CGRectMake(CGRectGetMaxX(self.iconImageView.frame)+8, 8, 200, 12);
        
        self.backImageView.frame = CGRectMake(self.iconImageView.frame.origin.x+22+8, 23, size.width+20, size.height+20);
        image = [UIImage imageNamed:@"bubbleSomeone"];
    }
    
    // 拉伸图片 参数1 代表从左侧到指定像素禁止拉伸，该像素之后拉伸，参数2 代表从上面到指定像素禁止拉伸，该像素以下就拉伸
    image = [image stretchableImageWithLeftCapWidth:image.size.width/2 topCapHeight:image.size.height/2];
    
    self.backImageView.image = image;
    
    self.textlabel.frame = CGRectMake(model.messageType?13:8, 5, size.width, size.height);
    self.textlabel.text = model.textString;
    self.backImageView.clipsToBounds = YES;
    
    self.cellHeight = CGRectGetMaxY(self.backImageView.frame)+20;

}

@end
