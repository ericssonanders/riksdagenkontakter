//
//  Person.h
//  TabBarTest
//
//  Created by Anders Ericsson on 2011-06-07.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PersonProtocol.h"


@interface Person : NSObject<PersonProtocol> {
    NSString *Fornamn;
	NSString *Efternamn;
    NSString *bildurl;
    NSString *webbsida;
}

@property(nonatomic,retain) NSString *Fornamn;
@property(nonatomic,retain) NSString *Efternamn;
@property(nonatomic,retain) NSString *bildurl;
@property(nonatomic,retain) NSString *webbsida;
@end
