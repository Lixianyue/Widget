//
//  TodayViewController.m
//  TodayWidget
//
//  Created by lxy on 2018/9/18.
//  Copyright © 2018年 Shenzhen MSD Technology Co.,LTD. All rights reserved.
//

#import "TodayViewController.h"
#import <NotificationCenter/NotificationCenter.h>
#import <ShareTable/ShareTable.h>
#import "ViewController.h"

@interface TodayViewController () <NCWidgetProviding>

@property (nonatomic,strong)ShareTableView *mainTBV;


@end

@implementation TodayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    __weak __typeof(self) weakSelf = self;
    
    
    _mainTBV = [[ShareTableView alloc]initWithFrame:CGRectMake(0, 0 , self.view.frame.size.width,self.view.frame.size.height) style:UITableViewStylePlain];
    _mainTBV.rowClickBlock = ^(NSInteger row) {
        if (row>1) {
           [weakSelf.extensionContext  openURL:[NSURL URLWithString:@"LxyTodayWidget://add" ]completionHandler:nil];
        }else{
            [weakSelf.extensionContext  openURL:[NSURL URLWithString:@"LxyTodayWidget://home" ]completionHandler:nil];
        }
   
    };
    [self.view addSubview:_mainTBV];
//    NSLog(@"%zd",_mainTBV.shareArray.count);
    self.extensionContext.widgetLargestAvailableDisplayMode = NCWidgetDisplayModeExpanded;
    
}

- (void)widgetPerformUpdateWithCompletionHandler:(void (^)(NCUpdateResult))completionHandler {
    // Perform any setup necessary in order to update the view.
    
    // If an error is encountered, use NCUpdateResultFailed
    // If there's no update required, use NCUpdateResultNoData
    // If there's an update, use NCUpdateResultNewData
    
    completionHandler(NCUpdateResultNewData);
}

//取消widget默认inset，让应用靠左
- (UIEdgeInsets)widgetMarginInsetsForProposedMarginInsets:(UIEdgeInsets)defaultMarginInsets {
    return UIEdgeInsetsZero;
}

/**
 activeDisplayMode有以下两种
 NCWidgetDisplayModeCompact, // 收起模式
 NCWidgetDisplayModeExpanded, // 展开模式
 */
- (void)widgetActiveDisplayModeDidChange:(NCWidgetDisplayMode)activeDisplayMode withMaximumSize:(CGSize)maxSize{
    if (@available(iOS 10.0, *)) {
        if (activeDisplayMode == NCWidgetDisplayModeExpanded) {
            self.preferredContentSize = CGSizeMake(0, 300);
        }else{
            self.preferredContentSize = maxSize;
        }
    } else {
        self.preferredContentSize = maxSize;
    }
}
@end
