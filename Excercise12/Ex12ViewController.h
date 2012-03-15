//
//  Ex12ViewController.h
//  Excercise12
//
//  Created by TPG on 3/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Ex12ViewController : UIViewController


@property (nonatomic, retain) IBOutlet UILabel *startLongTaskLabel;
@property (nonatomic, retain) IBOutlet UILabel *checkLongTaskLabel;
@property (nonatomic, retain) IBOutlet UIButton *startLongTaskButton;
@property (nonatomic, retain) IBOutlet UIButton *checkLongTaskButton;
@property (nonatomic, retain) IBOutlet UIActivityIndicatorView *activityIndicator;

-(void) longTask;
-(IBAction) startRepeatingTask;
-(void) updateGUI:(NSTimer *)aTimer;
-(IBAction) doSingularTask;

@end
