//
//  FirstViewController.m
//  HW4.1
//
//  Created by Admin on 17.05.17.
//  Copyright © 2017 GB. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()
@property (weak, nonatomic) IBOutlet UIButton *SuccButton;
@property (weak, nonatomic) IBOutlet UIButton *DrawViewButton;

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.SuccButton.layer.cornerRadius = 5;    /// радиус закругления
    self.SuccButton.layer.borderWidth = 3.0;   // толщина обводки
    self.SuccButton.layer.borderColor = [[UIColor grayColor] CGColor]; // цвет обводки
    self.SuccButton.clipsToBounds = true;  // не забудь это, а то не закруглиться
    
    self.DrawViewButton.layer.cornerRadius = 5;    /// радиус закругления
    self.DrawViewButton.layer.borderWidth = 3.0;   // толщина обводки
    self.DrawViewButton.layer.borderColor = [[UIColor grayColor] CGColor]; // цвет обводки
    self.DrawViewButton.clipsToBounds = true;  // не забудь это, а то не закруглиться
    
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
