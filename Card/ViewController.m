//
//  ViewController.m
//  Card
//
//  Created by Dilnur Yuldashev on 4/15/16.
//  Copyright © 2016 Dilnur Yuldashev. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
- (IBAction)touchCardButton:(id)sender {
    UIImage *cardBack = [UIImage imageNamed:@"card_back"];
    UIImage *cardFront = [UIImage imageNamed:@"card_front"];
    if([[sender currentTitle]length]){
        [sender setBackgroundImage:cardBack forState:UIControlStateNormal];
        [sender setTitle:@"" forState:UIControlStateNormal];
    }else{
        [sender setBackgroundImage:cardFront forState:UIControlStateNormal];
        [sender setTitle:@"A♣︎" forState:UIControlStateNormal];
    }
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
