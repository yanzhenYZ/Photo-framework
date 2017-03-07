//
//  ViewController.m
//  test
//
//  Created by yanzhen on 17/3/6.
//  Copyright © 2017年 v2tech. All rights reserved.
//

#import "ViewController.h"
#import "GFPSourceTableViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *test;
@end

@implementation ViewController
-(void)birthdaySelectedDone:(NSString *)birthday{
    NSLog(@"TTTT:%@",birthday);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    GFPSourceTableViewController *vc = [[GFPSourceTableViewController alloc] initWithStyle:UITableViewStyleGrouped];
    UINavigationController *nvc = [[UINavigationController alloc] initWithRootViewController:vc];
    [self presentViewController:nvc animated:YES completion:nil];
}


@end
