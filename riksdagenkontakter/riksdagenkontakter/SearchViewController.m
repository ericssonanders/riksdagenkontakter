//
//  SearchViewController.m
//  TabBarTest
//
//  Created by Anders Ericsson on 2011-06-04.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "SearchViewController.h"
#import "riksdagenkontakterAppDelegate.h"
#import "SearchResultController2.h"
#import "SBJSON.h"


@implementation SearchViewController

@synthesize lbl;
@synthesize btn;
@synthesize searchResultController;
@synthesize tfFornamn;
@synthesize tfEfternamn;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc
{
    [searchResultController release];
    [btn release];
    [lbl release];
    [tfFornamn release];
    [tfEfternamn release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    self.title = @"Sök";
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
        [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

-(IBAction)buttonPressed{
    
   
    
    if(searchResultController){
        [searchResultController release];
        searchResultController = nil;
    }
    
    
    if(!searchResultController)
    {
        SearchResultController2 *aSearchResultController = [[SearchResultController2 alloc] initWithNibName:@"SearchResultController2" bundle:nil];
        self.searchResultController = aSearchResultController;
        [aSearchResultController release];
    }
    
    searchResultController.fornamn = self.tfFornamn.text;
    searchResultController.efternamn = self.tfEfternamn.text;
    searchResultController.newSearch = true;
    
    riksdagenkontakterAppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    [delegate.navController pushViewController: self.searchResultController animated:YES];
}

@end
