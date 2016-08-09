//
//  ViewController.m
//  卡号中间星号
//
//  Created by zhaolei6451 on 16/6/28.
//  Copyright © 2016年 zhaolei6451. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    NSString* realCardNumber;
    __weak IBOutlet UITextField *TF;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    realCardNumber = @"";
}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    NSLog(@"%@",string);
    realCardNumber = [realCardNumber stringByAppendingString:string];
    
    return YES;
}
- (IBAction)logTFText:(id)sender {
    
    NSLog(@"%@",realCardNumber);
}

- (IBAction)TFChange:(UITextField *)sender {
    
    if (sender.text.length > 6&&sender.text.length < 11) {
         sender.text = [self replaceStringWithAsterisk:sender.text startLocation:6 lenght:sender.text.length - 6];
    }
   
}
-(NSString *)replaceStringWithAsterisk:(NSString *)originalStr startLocation:(NSInteger)startLocation lenght:(NSInteger)lenght
{
    NSString *newStr = originalStr;
    for (int i = 0; i < lenght; i++) {
        NSRange range = NSMakeRange(startLocation, 1);
        newStr = [newStr stringByReplacingCharactersInRange:range withString:@"*"];
        startLocation ++;
    }
    return newStr;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
