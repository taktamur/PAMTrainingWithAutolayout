//
//  PAMVariableHightCell.m
//  PAMTrainingWithAutolayout
//
//  Created by Takafumi Tamura on 2013/08/09.
//  Copyright (c) 2013年 田村 孝文. All rights reserved.
//

#import "PAMVariableHightCell.h"

@implementation PAMVariableHightCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

// cell自身のサイズを、ちゃんと表示出来るサイズに変える。
-(void)resizeBounds
{
    self.multiLineTextView.bounds = self.bounds;
    // ↑で横幅が決まる=縦幅が↓で取得できるようになる。
    CGSize textSize = self.multiLineTextView.contentSize;
    self.multiLineTextView.bounds= CGRectMake(0,
                                              0,
                                              textSize.width,
                                              textSize.height);
    // 奥の手：self.boundsを自身で押し広げてしまえ!
    self.bounds = CGRectMake(0,
                             0,
                             self.bounds.size.width,
                             textSize.height);
    
}
@end
