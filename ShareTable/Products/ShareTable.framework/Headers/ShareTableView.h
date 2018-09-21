//
//  ShareTableView.h
//  ShareTable
//
//  Created by lxy on 2018/9/18.
//  Copyright © 2018年 Shenzhen MSD Technology Co.,LTD. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShareTableView : UITableView<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)NSMutableArray *shareArray;

@end
