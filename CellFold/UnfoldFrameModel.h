//
//  UnfoldFrameModel.h
//  CellFold
//
//  Created by ZYXun on 16/7/5.
//  Copyright © 2016年 ZYX. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "UnfoldModel.h"
@interface UnfoldFrameModel : NSObject
@property (nonatomic, strong)UnfoldModel *model;

@property (nonatomic,assign)CGRect contentF;

@property (nonatomic,assign)CGRect unflodBtnF;

@property (nonatomic,assign)CGFloat cellH;
@end
