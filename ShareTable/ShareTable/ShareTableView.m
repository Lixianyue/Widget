//
//  ShareTableView.m
//  ShareTable
//
//  Created by lxy on 2018/9/18.
//  Copyright © 2018年 Shenzhen MSD Technology Co.,LTD. All rights reserved.
//

#import "ShareTableView.h"


@implementation ShareTableView

- (NSMutableArray *)shareArray{
    if (!_shareArray) {
       _shareArray = [[[NSUserDefaults alloc] initWithSuiteName:@"group.com.msd.app"] valueForKey:@"TextF"];
    }
    
    return _shareArray;
}


-(instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    if (self = [super initWithFrame:frame style:style]){
        
        self.dataSource = self;
        self.delegate = self;
        self.layer.cornerRadius = 10.f;
        self.showsHorizontalScrollIndicator = NO;
        self.showsVerticalScrollIndicator = NO;
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.tableFooterView = [[UIView alloc]init];
        self.bounces = NO;
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.shareArray.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 30.f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *str = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:str];
    
    if (!cell){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.text = self.shareArray[indexPath.row];
    cell.textLabel.font = [UIFont systemFontOfSize:15];
  
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (self.rowClickBlock) {
        self.rowClickBlock(indexPath.row);
    }
    
}



@end
