//
//  ARKitDemoAppDelegate.m
//  ARKitDemo using the iPhoneAugmentedRealityLib
//
//  Created by Niels Hansen on 1/21/2010.
//  Copyright Agilite Software 2010. All rights reserved.
//

#import "ARKitDemoAppDelegate.h"

@implementation ARKitDemoAppDelegate

@synthesize window;

- (void)applicationDidFinishLaunching:(UIApplication *)application {    
	
	if([ARKit deviceSupportsAR]){
		ARViewController *viewController = [[ARViewController alloc] initWithDelegate:self];
		[window addSubview:[viewController view]];
	}
	else{
		UIViewController *viewController = [[UIViewController alloc] init];
		UILabel *errorLabel = [[[UILabel alloc] init] autorelease];
		errorLabel.numberOfLines = 0;
		errorLabel.text = @"Augmented Reality is not supported on this device";
		errorLabel.frame = viewController.view.bounds;
		errorLabel.textAlignment = UITextAlignmentCenter;
		[viewController.view addSubview:errorLabel];
		[window addSubview:[viewController view]];
	}
	
    [window makeKeyAndVisible];
}

- (void)dealloc {
    [window release];
    [super dealloc];
}


-(NSMutableArray *)getLocations {

	NSMutableArray *locationArray = [[NSMutableArray alloc] init];
	ARGeoCoordinate *tempCoordinate;
	CLLocation		*tempLocation;
	
	
		
	
	tempLocation = [[CLLocation alloc] initWithLatitude:51.507937 longitude:-0.076188];
	tempCoordinate = [ARGeoCoordinate coordinateWithLocation:tempLocation locationTitle:@"Tower of London"];
	[locationArray addObject:tempCoordinate];
	[tempLocation release];
	
	
	
	
	
	return locationArray;
}



@end
