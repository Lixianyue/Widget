//
//  ShareTableView.h
//  ShareTable
//
//  Created by lxy on 2018/9/18.
//  Copyright © 2018年 Shenzhen MSD Technology Co.,LTD. All rights reserved.
//

#import <UIKit/UIKit.h>


/**
 点击TableViewCell的行事件

 @param row 行号/某一行
 */
typedef void(^RowClickBlock)(NSInteger row);

@interface ShareTableView : UITableView<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)NSMutableArray *shareArray; //数据源
@property (nonatomic,copy)RowClickBlock rowClickBlock;

@end
