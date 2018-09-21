//
//  InputControl.h
//  TodayWidth
//
//  Created by lxy on 2018/9/18.
//  Copyright © 2018年 Shenzhen MSD Technology Co.,LTD. All rights reserved.
//

#import <UIKit/UIKit.h>

//typedef void(^SaveBlock)(NSString *text);
typedef void(^SaveBlock)(void);
@interface InputControl : UIViewController

@property (nonatomic,copy)SaveBlock saveBlock;
@end
