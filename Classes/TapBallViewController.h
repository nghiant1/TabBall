//
//  TapBallViewController.h
//  TapBall
//
//  Created by Emir on 1/15/11.
//  Copyright __MyCompanyName__ 2011. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TapBallViewController : UIViewController {
	
	IBOutlet UIImageView *Ball1;
	NSTimer *mainTimer;
	IBOutlet UIButton *startButton;
}

@property(nonatomic, retain)  UIImageView *Ball1;
@property(nonatomic, retain)  NSTimer *mainTimer;
@property(nonatomic, retain)  UIButton *startButton;

-(IBAction)startMove;
-(void)moveBall;
-(BOOL)Intersecting:(CGPoint)loctouch:(UIImageView *)enemyimg;

@end

