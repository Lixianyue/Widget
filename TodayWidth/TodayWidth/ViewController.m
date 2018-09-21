//
//  ViewController.m
//  TodayWidth
//
//  Created by lxy on 2018/9/18.
//  Copyright © 2018年 Shenzhen MSD Technology Co.,LTD. All rights reserved.
//

#import "ViewController.h"
#import "InputControl.h"
#import <ShareTable/ShareTable.h>

@interface ViewController ()
@property (nonatomic,strong) ShareTableView *mainTBV;

@end

@implementation ViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    _mainTBV.shareArray = [[[NSUserDefaults alloc] initWithSuiteName:@"group.com.msd.app"] valueForKey:@"TextF"];
    
    [_mainTBV reloadData];
}

- (void)viewDidLoad{
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.view.backgroundColor = [UIColor whiteColor];
    UIBarButtonItem *rightBar = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(pushInput)];
    self.navigationItem.rightBarButtonItem = rightBar;
    
    [self initUI];
    
}

- (void)initUI{
    __weak __typeof(self) weakSelf = self;
    _mainTBV = [[ShareTableView alloc]initWithFrame:CGRectMake(0, 0 , self.view.frame.size.width,self.view.frame.size.height) style:UITableViewStylePlain];
    _mainTBV.rowClickBlock = ^(NSInteger row) {
        NSLog(@"%@",weakSelf.mainTBV.shareArray[row]);
    };
    [self.view addSubview:_mainTBV];
    
}

- (void)pushInput{
    
    InputControl *input = [[InputControl alloc]init];
    [self.navigationController pushViewController:input animated:YES];
    
}

@end
