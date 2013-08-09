//
//  PAMVariableHightCell.h
//  PAMTrainingWithAutolayout
//
//  Created by Takafumi Tamura on 2013/08/09.
//  Copyright (c) 2013年 田村 孝文. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PAMVariableHightCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UITextView *multiLineTextView;
-(void)resizeBounds;

@end
