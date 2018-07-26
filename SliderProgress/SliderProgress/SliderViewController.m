//
//  SliderViewController.m
//  SliderProgress
//
//  Created by hongwei Zheng on 2018/7/26.
//  Copyright © 2018年 hongwei Zheng. All rights reserved.
//

#import "SliderViewController.h"

#define kWidth [UIScreen mainScreen].bounds.size.width

@interface SliderViewController (){
    UIView *backView;
    NSMutableArray   *numbers;
    NSNumber         *number;
}
@property(nonatomic,strong)UISlider *slider;
@property(nonatomic,strong)UILabel  *botNumLab;

@end

@implementation SliderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:242.0/255.0 green:242.0/255.0 blue:242.0/255.0 alpha:1];
    [self addTextLab];
    [self addSLider];
    
    //从本地获取滑块设置的值
    NSUserDefaults *radiusNumber = [NSUserDefaults standardUserDefaults];
    number = [radiusNumber objectForKey:@"radiusNumber"];
    NSLog(@"number == %@",number);
    if(number){
        _slider.value = [number floatValue] / 50.0;
        NSUInteger index = (NSUInteger)(_slider.value);
        [_slider setValue:index animated:NO];
        NSLog(@"index ===== %ld",index);
        self.botNumLab.text = [NSString stringWithFormat:@"%@米",number];
    }
}


#pragma mark ==== 滑动滑块 ====
- (void)sliderValueChanged:(id)sender {
    UISlider *slider = (UISlider *)sender;
    NSUInteger index = (NSUInteger)(slider.value);
    [slider setValue:index animated:NO];
    number = numbers[index];
    //  NSLog(@"number: %@", number);
    //  NSLog(@"value === %.f",slider.value);
    self.botNumLab.text = [NSString stringWithFormat:@"%@米",number];
}



#pragma mark ===== 确定 =====
-(void)sureBtn:(UIButton *)sender{
    if(number){
        //本地存储滑块设置的值
        NSUserDefaults *radiusNumber = [NSUserDefaults standardUserDefaults];
        [radiusNumber setObject:number forKey:@"radiusNumber"];
        [self.navigationController popViewControllerAnimated:NO];
        NSLog(@"滑块设置的值为=== :%@",number);
    }else{
        NSLog(@"未设置半径");
    }
}



-(void)addTextLab{
    
    backView = [[UIView alloc] initWithFrame:CGRectMake(0, 84, kWidth, 85)];
    backView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:backView];
    
    UILabel *botLeftLab = [[UILabel alloc] initWithFrame:CGRectMake(12, 40, 40, 30)];
    botLeftLab.textColor = [UIColor blackColor];
    botLeftLab.font = [UIFont systemFontOfSize:14];
    botLeftLab.text = @"半径";
    [backView addSubview:botLeftLab];
    
    UIImageView *redImg = [[UIImageView alloc] initWithFrame:CGRectMake(55, 12, 51, 26)];
    redImg.image = [UIImage imageNamed:@"safeAreaRed"];
    [backView addSubview:redImg];
    
    _botNumLab = [[UILabel alloc] initWithFrame:CGRectMake(3, 3, 45, 20)];
    _botNumLab.textColor = [UIColor whiteColor];
    _botNumLab.textAlignment = NSTextAlignmentCenter;
    _botNumLab.font = [UIFont systemFontOfSize:13];
    _botNumLab.text = @"0米";
    [redImg addSubview:_botNumLab];
    
    UILabel *botRightLab = [[UILabel alloc] initWithFrame:CGRectMake(kWidth - 72, 40, 60, 30)];
    botRightLab.textColor = [UIColor blackColor];
    botRightLab.font =[UIFont systemFontOfSize:14];
    botRightLab.text = @"1000米";
    [backView addSubview:botRightLab];
}


-(void)addSLider{
    //初始化存放滑块值的数组
    numbers = [[NSMutableArray alloc] init];
    //初始化滑块
    _slider = [[UISlider alloc]initWithFrame:CGRectMake(52, 45, 230, 25)];
    //让滑块一次滑动50，总共滑动20次
    for (int i = 0; i <= 20; i++) {
        [numbers addObject:@(i * 50)];
    }
    NSInteger numberOfSteps = ((float)[numbers count] - 1);
    _slider.maximumValue = numberOfSteps;
    _slider.minimumValue = 0;
    [_slider addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];
    _slider.continuous = YES;
    _slider.minimumTrackTintColor = [UIColor greenColor]; //进度条颜色
    [backView addSubview:_slider];
    
    
    UIButton *sureBtn = [[UIButton alloc] initWithFrame:CGRectMake(50, 260, kWidth - 100, 44)];
    sureBtn.backgroundColor = [UIColor blueColor];
    sureBtn.layer.cornerRadius = 3;
    [sureBtn setTitle:@"确定" forState:UIControlStateNormal];
    [sureBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [sureBtn addTarget:self action:@selector(sureBtn:) forControlEvents:UIControlEventTouchUpInside];
    sureBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [self.view addSubview:sureBtn];
    
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
