
#import "drawingView.h"


CGPoint midPoint(CGPoint p1, CGPoint p2)
{
    return CGPointMake((p1.x + p2.x) * 0.5, (p1.y + p2.y) * 0.5);
}


@implementation drawingView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self commonInit];
    }
    return self;
}

-(id) initWithCoder:(NSCoder *)aDecoder {
    
    self = [super initWithCoder:aDecoder];
    
    if (self) {
        [self commonInit];
    }
    return self;
}



-(void) commonInit {
    
    //initialize bezier path object
    path = [[UIBezierPath bezierPath] retain];
    [path setLineCapStyle:kCGLineCapRound];
    [path setLineWidth:5];
}



-(void) clear {
    [path removeAllPoints];
    [self setNeedsDisplay];
}



-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    firstPoint = [touch previousLocationInView:self];
    secondPoint = [touch previousLocationInView:self];
    currentPoint = [touch locationInView:self];
    [path moveToPoint:currentPoint];
    [path addLineToPoint:currentPoint];
    [self setNeedsDisplay];
    
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    UITouch *touch = [touches anyObject];
    //here we save 3 last points
    secondPoint = firstPoint;
    firstPoint = [touch previousLocationInView:self];
    currentPoint = [touch locationInView:self];

    //points in the middle of the line segments
    CGPoint mid1 = midPoint(firstPoint, secondPoint);
    CGPoint mid2 = midPoint(currentPoint, firstPoint);

    [path moveToPoint:mid1]; //start new curve between two actual touches.
    [path addQuadCurveToPoint:mid2 controlPoint:firstPoint]; //curves connect in middle points and use actual touch points as control points.

    [self setNeedsDisplay]; //redraw view.
}




- (void)drawRect:(CGRect)rect
{
    [path stroke]; //redraw whole bezier path
}





@end
