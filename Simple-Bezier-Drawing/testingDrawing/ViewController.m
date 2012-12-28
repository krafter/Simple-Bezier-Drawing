#import "ViewController.h"

#import "drawingView.h"


@interface ViewController ()

@end

@implementation ViewController




-(IBAction) clearAction:(id)sender {
    drawingView *view = (drawingView*) self.view;
    [view clear];
}




@end
