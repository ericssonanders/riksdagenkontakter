//
//  SearchResultController.m
//  TabBarTest
//
//  Created by Anders Ericsson on 2011-06-04.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "SearchResultController.h"


@implementation SearchResultController


- (void)viewDidLoad {
    self.title = @"Sökresultat";
	[super viewDidLoad];
}


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
      [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
	    [super dealloc];
}


@end
