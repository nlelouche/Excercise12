//
//  Ex12ViewController.m
//  Excercise12
//
//  Created by TPG on 3/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Ex12ViewController.h"

@implementation Ex12ViewController

@synthesize startLongTaskLabel = _startLongTaskLabel;
@synthesize checkLongTaskLabel = _checkLongTaskLabel;
@synthesize startLongTaskButton = _startLongTaskButton;
@synthesize checkLongTaskButton = _checkLongTaskButton;
@synthesize activityIndicator = _activityIndicator;

NSThread *thread; 
NSTimer *timer; 
int i = 0;


-(void) longTask{ 
	do { 
		i++; 
	} while (i<=1999999999); 
    thread = nil;
    i = 0;
	[_activityIndicator stopAnimating]; 
} 

-(IBAction) startRepeatingTask{ 
	[_activityIndicator startAnimating]; 
	
	if(thread == nil) 
		thread = [[NSThread alloc] initWithTarget:self 
                                         selector:@selector(longTask) 
                                           object:nil]; 
	
	if(![thread isExecuting]) 
		[thread start]; 
	
	//[self longTask]; 
	
	_startLongTaskLabel.text = @"Started long task"; 
	_checkLongTaskLabel.text = @"Started long task"; 
} 

-(void) updateGUI:(NSTimer *)aTimer{ 
	_startLongTaskLabel.text = [NSString stringWithFormat:@"Up to int %i", i]; 
} 

-(IBAction) doSingularTask{ 
	if([thread isExecuting]) 
		_checkLongTaskLabel.text = @"Task still executing..."; 
	else 
    {
		_checkLongTaskLabel.text = @"Task is now finished!"; 
    }
	timer = [[NSTimer scheduledTimerWithTimeInterval:(0.5) 
                                              target:self
                                            selector:@selector(updateGUI:) 
                                            userInfo:nil 
                                             repeats:YES]         
             retain]; 
} 

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
