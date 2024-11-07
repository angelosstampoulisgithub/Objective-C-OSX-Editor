//
//  ViewController.h
//  Objective-C-OSX-Editor
//
//  Created by Angelos Staboulis on 7/11/24.
//

#import <Cocoa/Cocoa.h>

@interface ViewController : NSViewController

@property (weak) IBOutlet NSScrollView *mainScrollTextView;

@property (unsafe_unretained) IBOutlet NSTextView *textView;


@end

