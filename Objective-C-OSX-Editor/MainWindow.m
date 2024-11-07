//
//  MainWindow.m
//  Objective-C-OSX-Editor
//
//  Created by Angelos Staboulis on 7/11/24.
//

#import "MainWindow.h"
#import "ViewController.h"
#import "PDFKit/PDFKit.h"
@interface MainWindow ()

@end

@implementation MainWindow

- (void)windowDidLoad {
    [super windowDidLoad];

    [[self window] setContentSize:NSMakeSize(900, 600)];
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
}

- (IBAction)btnOpen:(id)sender {
       NSOpenPanel *openPanel = [[NSOpenPanel alloc] init];
       openPanel.allowsMultipleSelection = false;
       openPanel.canChooseDirectories = false;
       openPanel.canCreateDirectories = false;
       openPanel.canChooseFiles = true;
       [openPanel beginWithCompletionHandler:^(NSModalResponse result) {
           if (result == NSModalResponseOK){
               self->_filename = [[openPanel URL] filePathURL].path;
               ViewController *viewController = (ViewController *)[NSApplication sharedApplication].windows.firstObject.contentViewController;
               viewController.textView.string = [NSString stringWithContentsOfFile:self->_filename encoding:NSUTF8StringEncoding error:nil];
           }
       }];
}

- (IBAction)btnNewFile:(id)sender {
    ViewController *viewController = (ViewController *)[NSApplication sharedApplication].windows.firstObject.contentViewController;
    viewController.textView.string = @"";

}
- (IBAction)btnExit:(id)sender {
    exit(0);
}

- (IBAction)btnPrint:(id)sender {
    ViewController *viewController = (ViewController *)[NSApplication sharedApplication].windows.firstObject.contentViewController;
    NSPrintInfo *printInfo = [NSPrintInfo sharedPrintInfo];
    NSString *printText = viewController.textView.string;
    NSTextView *printView = [[NSTextView alloc] initWithFrame:CGRectMake(0, 0, 600, 600)];
    [printView setString:printText];
    
    NSPrintOperation *printOperation = [NSPrintOperation printOperationWithView:printView printInfo:printInfo];
    [printOperation runOperation];
}

- (IBAction)btnSave:(id)sender {
    long runResult;
     
    /* create or get the shared instance of NSSavePanel */
    NSSavePanel *sp = [NSSavePanel savePanel];
     
    [sp setTitle:@"Save File"];

    runResult = [sp runModal];
     
    /* if successful, save file under designated name */
    if (runResult == NSModalResponseOK) {
        NSFileManager *filemanager = [NSFileManager defaultManager];
        ViewController *viewController = (ViewController *)[NSApplication sharedApplication].windows.firstObject.contentViewController;

        self->_filename = [[sp URL] filePathURL].path;
        NSData *dataText = [viewController.textView.string dataUsingEncoding:NSUTF8StringEncoding];

        [filemanager createFileAtPath:self->_filename contents:dataText attributes:nil];
    }
   
}
@end
