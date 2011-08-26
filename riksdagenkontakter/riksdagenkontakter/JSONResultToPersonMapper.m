//
//  JSONResultToPersonMapper.m
//  TabBarTest
//
//  Created by Anders Ericsson on 2011-06-07.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "JSONResultToPersonMapper.h"
#import "Person.h"

@implementation JSONResultToPersonMapper


-(Person *) Map:(NSDictionary *)jsonResult{
	Person *tmpPerson = [[Person alloc] init];
	tmpPerson.Fornamn = (NSString *)[jsonResult valueForKey:@"tilltalsnamn"];
	tmpPerson.Efternamn = (NSString *)[jsonResult valueForKey:@"efternamn"];
	return [tmpPerson autorelease];
}

-(NSMutableArray *) MapList:(NSArray *)jsonResults{
	NSDictionary *traff;
	NSMutableArray *tmpListOfDokument = [[NSMutableArray alloc] init];
	Person *person;
	int i = 0;
	
	for (i = 0; i < jsonResults.count; i++) {
		traff = (NSDictionary *)[jsonResults objectAtIndex: i];
		person = [self Map:traff];
		[tmpListOfDokument addObject: person];
	}
	
	return [tmpListOfDokument autorelease];
}

@end
