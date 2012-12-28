

//This view receives touches and draws a Quadratic Bezier curves by them. //http://en.wikipedia.org/wiki/B%C3%A9zier_curve
//UIBezierPath - is a UIKit class that implements actual Bezier calculations.


#import <UIKit/UIKit.h>

@interface drawingView : UIView {
    
    UIBezierPath *path;
    CGPoint firstPoint, secondPoint, currentPoint;
}

-(void) clear;

@end
