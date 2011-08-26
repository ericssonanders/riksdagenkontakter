//
//  RiksdagenServiceAgent.m
//  Control Fun
//
//  Created by Anders Ericsson on 2011-02-03.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "RiksdagenServiceAgent.h"
#import "ASIHTTPRequest.h"

@implementation RiksdagenServiceAgent

- (id) makeSynchronizedRequest: (NSURL *) url {
	
    //TODO Ensure properly formatted url!
	NSURLRequest *request = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestReturnCacheDataElseLoad timeoutInterval:30];
    
	NSData *urlData;
	
    NSURLResponse *response;
	
    NSError *error;
	
    //TODO Handle timeouts and errors!
	urlData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
	NSString *result = [[NSString alloc] initWithData:urlData encoding:NSUTF8StringEncoding]; 
	return [result autorelease];
}


- (void) makeRequest:(NSURL *)url delegate:(id)delegate delegateProgress:(id)delegateProgress;
{
    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
    request.delegate = delegate;
    request.downloadProgressDelegate = delegateProgress;
    [request startAsynchronous];
    
}
@end
