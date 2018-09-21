//
//  InputControl.m
//  TodayWidth
//
//  Created by lxy on 2018/9/18.
//  Copyright © 2018年 Shenzhen MSD Technology Co.,LTD. All rights reserved.
//

#import "InputControl.h"

@interface InputControl ()<UITextFieldDelegate>
@property (nonatomic,strong)UITextField *textF;
@end

@implementation InputControl

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.view.backgroundColor = [UIColor whiteColor];
    [self initInputUI];
}

- (void)initInputUI{
    
    _textF = [[UITextField alloc]init];
    _textF.frame = CGRectMake(60, 60,self.view.frame.size.width-60*2, 45);
    _textF.backgroundColor = [UIColor clearColor];
    _textF.font = [UIFont systemFontOfSize:15];
    _textF.clearButtonMode = UITextFieldViewModeAlways;
    _textF.layer.cornerRadius = 10.f;
    _textF.layer.borderColor = [UIColor grayColor].CGColor;
    _textF.layer.borderWidth = .8f;
    _textF.delegate = self;
    [self.view addSubview:_textF];
    
    
    UIButton *saveBtn = [[UIButton alloc]init];
    [saveBtn setTitle:@"保存" forState:UIControlStateNormal];
    [saveBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    saveBtn.frame = CGRectMake((self.view.frame.size.width-60)/2, 130, 60, 40);
    [saveBtn addTarget:self action:@selector(saveClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:saveBtn];
//    [_textF addObserver:self forKeyPath:@"text" options:NSKeyValueObservingOptionOld |NSKeyValueObservingOptionNew context: nil];
    
}

//- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
//    NSLog(@"keypath = %@\n object = %@\n change = %@\n",keyPath,object,change);
//}

- (void)saveClick{
    _textF.text  = [_textF.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    
    if (_textF.text.length){
        NSArray *arr = [[[NSUserDefaults alloc] initWithSuiteName:@"group.com.msd.app"] valueForKey:@"TextF"];
        NSMutableArray *widgetArray = [NSMutableArray array];
        for (int i=0; i<arr.count; i++) {
            [widgetArray addObject:arr[i]];
        }
        [widgetArray addObject:_textF.text];
        
//        NSUserDefaults *def = [[NSUserDefaults alloc]initWithSuiteName:@"group.com.msd.app"];
//        [def setValue:widgetArray forKey:@"TextF"];
//        [def synchronize];
        [[[NSUserDefaults alloc]initWithSuiteName:@"group.com.msd.app"]setValue:widgetArray forKey:@"TextF"];
        [self.navigationController popViewControllerAnimated:YES];
        
        
    }
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    return [textField resignFirstResponder];
}
@end
