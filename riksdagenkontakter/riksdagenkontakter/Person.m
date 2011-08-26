//
//  Person.m
//  TabBarTest
//
//  Created by Anders Ericsson on 2011-06-07.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Person.h"


@implementation Person

@synthesize Fornamn;
@synthesize Efternamn;
@synthesize bildurl;
@synthesize webbsida;


-(void)dealloc{
    NSLog(@"Person Destructor");
	[Fornamn release];
    [Efternamn release];
    [bildurl release];
    [webbsida release];
	[super dealloc];
}


@end
