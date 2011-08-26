//
//  XmlParser.h
//  TabBarTest
//
//  Created by Anders Ericsson on 2011-06-19.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

@interface XmlParser : NSObject <NSXMLParserDelegate> {
    NSMutableArray *personlista;
    Person *currentPerson;
    NSMutableString *currentStringValue;
    NSMutableString *currentKod;
}

@property (nonatomic, retain) NSMutableArray *personlista;
@property (nonatomic, retain) Person *currentPerson;
@property (nonatomic, retain) NSMutableString *currentStringValue;
@property (nonatomic, retain) NSMutableString *currentKod;

@end
