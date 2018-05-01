//
//  ViewController.m
//  CellFold
//
//  Created by ZYXun on 16/7/5.
//  Copyright © 2016年 ZYX. All rights reserved.
//

#import "ViewController.h"
#import "UnfoldCell.h"
#import "UnfoldModel.h"
#import "UnfoldFrameModel.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,UnfoldDelegate>
@property (nonatomic,strong)NSMutableArray *dataArray;

@property (nonatomic,strong)UITableView * tableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
    [self initLoadData];
}


- (void)initLoadData{
    NSArray *array  = @[@"Apple is supplying this information to help you plan for the adoption of the technologies and programming interfaces described herein for use on Apple-branded products. This information is subject to change, and software implemented according to this document should be tested with final operating system software and final documentation. Newer versions of this document may be provided with future betas of the API or technology.",@"维基百科（Wikipedia），是一个基于维基技术的多语言百科全书协作计划，这是一部用多种语言编写的网络百科全书。  维基百科一词取自于该网站核心技术“Wiki”以及具有百科全书之意的共同创造出来的新混成词“Wikipedia”，维基百科是由非营利组织维基媒体基金会负责营运，并接受捐赠。",@"2002年2月，由Edgar Enyedy领导，非常活跃的西班牙语维基百科突然退出维基百科并建立了他们自己的自由百科（Enciclopedia Libre）；理由是未来可能会有商业广告及失去主要的控制权。",@"来看看劳动法克林顿刷卡思考对方卡拉卡斯的楼房卡拉卡斯的疯狂拉萨的罚款 ",@"2015年11月1日，英文维基百科条目数突破500万",@"2015年6月15日，维基百科全面采用HTTPS：保护用户敏感信息。"];
    
    for (NSString *str in array) {
        UnfoldModel *model = [[UnfoldModel alloc] init];
        model.contentStr = str;
        model.isUnflod = NO;//给定初始值
        
        UnfoldFrameModel *frameModel = [[UnfoldFrameModel alloc] init];
        frameModel.model = model;
        [self.dataArray addObject:frameModel];
    }
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
   return self.dataArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellId = @"cellId";
    UnfoldCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil) {
        cell = [[UnfoldCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    UnfoldFrameModel *model = [self.dataArray objectAtIndex:indexPath.row];
    cell.frameModel = model;
    cell.delegate = self;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    UnfoldFrameModel *frameModel = [self.dataArray objectAtIndex:indexPath.row];
    return frameModel.cellH;
}

- (void)UnfoldCellDidClickUnfoldBtn:(UnfoldFrameModel *)model{
    NSInteger index = [self.dataArray indexOfObject:model];
    UnfoldModel *model1 = model.model;
    model1.isUnflod = !model1.isUnflod;
    model.model = model1;
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:index inSection:0];
    [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}


- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
        _tableView.frame = self.view.bounds;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.allowsSelection = NO;
    }
    return _tableView;
}

- (NSMutableArray *)dataArray{
    if (!_dataArray) {
        _dataArray = [[NSMutableArray alloc] init];
    }
    return _dataArray;
}
@end
