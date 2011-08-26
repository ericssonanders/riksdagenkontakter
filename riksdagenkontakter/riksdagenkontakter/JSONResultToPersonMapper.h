//
//  JSONResultToPersonMapper.h
//  TabBarTest
//
//  Created by Anders Ericsson on 2011-06-07.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

@interface JSONResultToPersonMapper : NSObject {
    
}

- (Person *) Map : (NSDictionary *)jsonResult;
- (NSMutableArray *) MapList : (NSArray *)jsonResults;
@end
