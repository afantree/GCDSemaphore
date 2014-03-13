//
//  ViewController.m
//  GCDSemaphore
//
//  Created by 阿凡树 QQ：729397005 on 14-3-13.
//  Copyright (c) 2014年 ManGang. All rights reserved.
//

#import "ViewController.h"
#import "SocketServer.h"
@interface ViewController ()
{
    int      _index;
}
@end

@implementation ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [_inputLabel resignFirstResponder];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    _index = 0;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)sendButtonPressed:(UIButton*)button
{
    [[SocketServer share] sendString:[NSString stringWithFormat:@"%d,%@",_index,_inputLabel.text] withSuccessBlock:^(NSString *str) {
        _outputLabel.text = str;
    } andFailBlock:^(NSString *str) {
    }];
    _index++;
}
@end
