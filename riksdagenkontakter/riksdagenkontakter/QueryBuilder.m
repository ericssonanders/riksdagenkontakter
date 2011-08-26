//
//  QueryBuilder.m
//  TabBarTest
//
//  Created by Anders Ericsson on 2011-06-07.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "QueryBuilder.h"


@implementation QueryBuilder

@synthesize baseURL;

-(void) inititialize:(NSString *)fornamn{
    NSString *tmpString = @"http://data.riksdagen.se/personlista/?utformat=xml";
    NSString *forNamnqryString = [[NSString alloc] initWithFormat:@"&fnamn=%@", fornamn];
    baseURL = [tmpString stringByAppendingString: forNamnqryString];
    [forNamnqryString release];
}

-(void) dealloc{
    [baseURL release];
    [super dealloc];
}

@end

