//
//  UnfoldCell.h
//  CellFold
//
//  Created by ZYXun on 16/7/5.
//  Copyright © 2016年 ZYX. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UnfoldFrameModel.h"
#import "UnfoldModel.h"
@class UnfoldFrameModel;
@protocol UnfoldDelegate <NSObject>

-(void)UnfoldCellDidClickUnfoldBtn:(UnfoldFrameModel *)model;

@end


@interface UnfoldCell : UITableViewCell
@property (nonatomic,strong)UnfoldFrameModel *frameModel;
@property (nonatomic,weak)id<UnfoldDelegate>delegate;
@end
