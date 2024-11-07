//
//  ViewController.m
//  Objective-C-OSX-Editor
//
//  Created by Angelos Staboulis on 7/11/24.
//

#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
}
- (void)viewDidLayout{
    [_mainScrollTextView setFrame:self.view.frame];
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}


@end
