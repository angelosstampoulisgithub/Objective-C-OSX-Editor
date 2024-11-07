//
//  MainWindow.h
//  Objective-C-OSX-Editor
//
//  Created by Angelos Staboulis on 7/11/24.
//

#import <Cocoa/Cocoa.h>

NS_ASSUME_NONNULL_BEGIN

@interface MainWindow : NSWindowController
- (IBAction)btnNewFile:(id)sender;
- (IBAction)btnOpen:(id)sender;
@property NSString *filename;
- (IBAction)btnSave:(id)sender;
- (IBAction)btnPrint:(id)sender;
- (IBAction)btnExit:(id)sender;

@end

NS_ASSUME_NONNULL_END
