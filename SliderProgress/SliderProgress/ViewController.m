//
//  ViewController.m
//  SliderProgress
//
//  Created by hongwei Zheng on 2018/7/26.
//  Copyright © 2018年 hongwei Zheng. All rights reserved.
//

#import "ViewController.h"
#import "SliderViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self addPushBtn];
}

-(void)pushBtn:(UIButton *)sender{
    SliderViewController *sliderVC = [[SliderViewController alloc] init];
    [self.navigationController pushViewController:sliderVC animated:YES];
}


-(void)addPushBtn{
    UIButton *pushBtn = [[UIButton alloc] initWithFrame:CGRectMake(135, 300, 100, 40)];
    pushBtn.layer.cornerRadius = 10;
    pushBtn.layer.borderWidth = 1;
    pushBtn.layer.borderColor = [UIColor redColor].CGColor;
    [pushBtn setTitle:@"push" forState:UIControlStateNormal];
    [pushBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    pushBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    [pushBtn addTarget:self action:@selector(pushBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:pushBtn];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
