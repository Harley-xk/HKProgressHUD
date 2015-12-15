//
//  ViewController.m
//  HKProgressHUD
//
//  Created by Harley.xk on 15/12/15.
//  Copyright © 2015年 Harley.xk. All rights reserved.
//

#import "ViewController.h"
#import "HKProgressHUD.h"
#import "UIViewController+HKProgressHUD.h"

@interface ViewController ()
@property (assign, nonatomic) CGFloat progress;
@property (strong, nonatomic) NSTimer *progressTimer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // Uncomment these code to see something intersting
//    self.hk_progressHUD.maskColor = [UIColor colorWithWhite:0.000 alpha:0.200];
//    self.hk_progressHUD.backgroundColor = [UIColor colorWithRed:0.000 green:0.646 blue:1.000 alpha:0.850];
//    self.hk_progressHUD.tintColor = [UIColor redColor];
}


- (IBAction)showText:(id)sender {
    [self hk_autoShowText:@"This is a message!"];
}
- (IBAction)showActivity:(id)sender {
    [self hk_showActivityWithMessage:@"This is a message!"];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self hk_autoShowSucceedMessage:@"Finished !"];
    });
}
- (IBAction)showActivityWithoutMessage:(id)sender {
    [self hk_showActivityWithMessage:nil];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self hk_hideProgressHUD];
    });
}
- (IBAction)showInfo:(id)sender {
    [self hk_autoShowInfoMessage:@"This is a message!"];
}
- (IBAction)showAlert:(id)sender {
    [self hk_autoShowAlertMessage:@"This is a message!"];
}
- (IBAction)showSuccess:(id)sender {
    [self hk_autoShowSucceedMessage:@"This is a message!"];
}
- (IBAction)showError:(id)sender {
    [self hk_autoShowErrorMessage:@"This is a message!"];
}
- (IBAction)showProgress:(id)sender {
    _progress = 0;
    [self hk_showProgress:0 withMessage:@"Doing..."];
    self.progressTimer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(updateProgress) userInfo:nil repeats:YES];
}

- (void)updateProgress
{
    _progress += 0.02;
    [self hk_showProgress:_progress withMessage:@"Doing..."];
    
    if (_progress >= 1) {
        [self.progressTimer invalidate];
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.25 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self hk_autoShowSucceedMessage:@"Done!"];
        });
    }
}

@end
