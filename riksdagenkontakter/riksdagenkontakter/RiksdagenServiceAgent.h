//
//  RiksdagenServiceAgent.h
//  Control Fun
//
//  Created by Anders Ericsson on 2011-02-03.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface RiksdagenServiceAgent : NSObject {
}
- (id) makeSynchronizedRequest: (NSURL *) url;
- (void) makeRequest:(NSURL *)url delegate:(id)delegate delegateProgress:(id)delegateProgress;

@end