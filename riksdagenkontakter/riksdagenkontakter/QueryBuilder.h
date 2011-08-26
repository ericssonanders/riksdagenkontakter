//
//  QueryBuilder.h
//  TabBarTest
//
//  Created by Anders Ericsson on 2011-06-07.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface QueryBuilder : NSObject {
    NSString *baseURL;
}

@property (nonatomic,retain) NSString *baseURL;

-(void) inititialize: (NSString *)fornamn;

@end
