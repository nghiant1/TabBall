//
//  TapBallViewController.m
//  TapBall
//
//  Created by Emir on 1/15/11.
//  Copyright __MyCompanyName__ 2011. All rights reserved.
//

#import "TapBallViewController.h"

@implementation TapBallViewController

@synthesize mainTimer, Ball1, startButton;

CGPoint Destination;
CGFloat xamt, yamt; // x and y steps to move 
CGFloat speed = 50; // speed

- (void)dealloc {
    [super dealloc];
	[mainTimer, Ball1, startButton release];
}



- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	
	
	UITouch *touch = [[event allTouches] anyObject];
	CGPoint location = [touch locationInView:self.view]; 
	// if user touched ball, stop timer 
	if ([self Intersecting:location :Ball1]) {
		[mainTimer invalidate];
		mainTimer = nil;
		startButton.hidden = NO;
	}
	
}	

-(BOOL)Intersecting:(CGPoint)loctouch:(UIImageView *)enemyimg {
	CGFloat x1 = loctouch.x;
	CGFloat y1 = loctouch.y;
	
	CGFloat x2 = enemyimg.frame.origin.x;
	CGFloat y2 = enemyimg.frame.origin.y;
	CGFloat w2 = enemyimg.frame.size.width;
	CGFloat h2 = enemyimg.frame.size.height;
	
	if ((x1>x2)&&(x1<x2+w2)&&(y1>y2)&&(y1<y2+h2))
		return YES;
	else
		return NO;
	
}




-(void)moveBall {
	// xdist and ydist is to check the current distance of the sprite to the destination point.
	// we are only interested in the distance so direction (-ve or +ve) does not matter, hence
	// we use fabs() function
	CGFloat xdist = fabs(Destination.x-Ball1.center.x); // fabs gives always +ve value
	CGFloat ydist = fabs(Destination.y-Ball1.center.y);
	
	// Normally, to compare 2 points, we can use CGPointEqualToPoint, but that requires an
	// exact match of points. In our case, since our steps are in CGFloat, each steps make the
	// location to be a non round number, but our destination is always a round number. So
	// we cannot use CGPointEqualToPoint. Instead we just check for the distance, if it is close
	// enough to the destination, then it is time to give it a new destination. 
	
	if ((xdist<5)&&(ydist<5)) { 
		Destination = CGPointMake(arc4random() % 320, arc4random() % 480);
		xamt = ((Destination.x - Ball1.center.x) / speed);
		yamt = ((Destination.y - Ball1.center.y) / speed);
	} else {
		//move it if distance is still far
		Ball1.center = CGPointMake(Ball1.center.x+xamt, Ball1.center.y+yamt);
	}
}

-(IBAction)startMove {
	startButton.hidden = YES;
	
	// assign a random location within the view of size 320x480.
	Destination = CGPointMake(arc4random() % 320, arc4random() % 480); 
	// calculate steps base on speed specified and distance between 2 points
	xamt = ((Destination.x - Ball1.center.x) / speed);
	yamt = ((Destination.y - Ball1.center.y) / speed);
	
	// ask timer to execute moveBall repeatedly each 0.2 seconds.
	mainTimer = [NSTimer scheduledTimerWithTimeInterval:(0.02) target:self selector:@selector(moveBall) userInfo:nil repeats: YES];
}


/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/


/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}




@end
