//
//  ViewController.m
//  ReposBrowser
//
//  Created by Kamil Burczyk on 08.02.2014.
//  Copyright (c) 2014 Sigmapoint. All rights reserved.
//

#import "ViewController.h"
#import "NetworkLib.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UITextView *textView;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (IBAction)showRepos:(UIButton *)sender {
    NetworkLib *nl = [[NetworkLib alloc] init];
    [nl getGithubReposForUser:_textField.text withSuccess:^(id responseObject) {
        _textView.text = [NSString stringWithFormat:@"%@", responseObject];
    } failure:^(NSError *error) {
        _textView.text = @"Error occured";
    }];
    
    [_textField resignFirstResponder];
}

@end
