//
//  UnfoldFrameModel.m
//  CellFold
//
//  Created by ZYXun on 16/7/5.
//  Copyright © 2016年 ZYX. All rights reserved.
//

#import "UnfoldFrameModel.h"

@implementation UnfoldFrameModel
- (void)setModel:(UnfoldModel *)model{
    _model = model;
    CGFloat cellW = [UIScreen mainScreen].bounds.size.width;
    CGFloat margin = 8;
    CGFloat contentLabel = cellW - 2*margin;
    CGFloat contentH = [model.contentStr boundingRectWithSize:CGSizeMake(contentLabel, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:16]} context:nil].size.height;
    CGFloat onelineH = [@"" boundingRectWithSize:CGSizeMake(contentLabel, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:16]} context:nil].size.height;
    
    CGFloat btnH = 0;
    if (!model.isUnflod) {
        if (contentH >= 3*onelineH) {
            contentH = 3*onelineH;
            btnH = 20;
        }else{
            btnH = 0;
        }
    }else{
        btnH = 20;
    }
    
    self.contentF = CGRectMake(margin, margin, contentLabel, contentH);
    
    CGFloat btnW = 50;
    CGFloat cellMaxH = 0;
    if (btnH == 0) {//只有一行
        self.unflodBtnF = CGRectZero;
        cellMaxH = CGRectGetMaxY(self.contentF)+margin;
    }else{
    
        self.unflodBtnF = CGRectMake(cellW-btnW-margin, CGRectGetMaxY(self.contentF), btnW, 20);
        cellMaxH = CGRectGetMaxY(self.unflodBtnF)-margin;
    }
    
    self.cellH = cellMaxH+margin;
    
}
@end
