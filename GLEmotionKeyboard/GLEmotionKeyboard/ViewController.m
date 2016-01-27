//
//  ViewController.m
//  GLEmotionKeyboard
//
//  Created by jiaguanglei on 16/1/27.
//  Copyright © 2016年 roseonly. All rights reserved.
//

#import "ViewController.h"
#import "PPComposeViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    self.view.backgroundColor = [UIColor yellowColor];
    
    
    UILabel *alert = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.width, 100)];
    alert.centerY = self.view.centerY;
    alert.font = [UIFont boldSystemFontOfSize:40];
    alert.text = @"点我啊";
    alert.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:alert];
    
    
    
//    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
//    btn.centerX = self.view.centerX;
//    btn.centerY = self.view.height * 0.7;
//    btn.width = 50;
//    btn.height = 50;
//    btn.hidden = NO;
//    [btn setImage:[[UIImage imageNamed:@"lxh_zana.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
////    btn.imageView.image = [UIImage imageNamed:@"lxh_zana.png"];
////    btn.imageView.frame = btn.bounds;
//    btn.backgroundColor = [UIColor greenColor];
//    btn.titleLabel.text = @"123";
//    LogGreen(@"%@", NSStringFromCGRect(btn.frame));
//    LogRed(@"%@", btn.currentImage);
//    [self.view addSubview:btn];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    PPComposeViewController *composeVC = [[PPComposeViewController alloc] init];
    [self presentViewController:[[UINavigationController alloc] initWithRootViewController:composeVC] animated:YES completion:^{
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
