//
//  XmlParser.m
//  TabBarTest
//
//  Created by Anders Ericsson on 2011-06-19.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "XmlParser.h"
#import "Person.h"

@implementation XmlParser

@synthesize personlista;
@synthesize currentPerson;
@synthesize currentStringValue;
@synthesize currentKod;

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict {
    
    if ( [elementName isEqualToString:@"personlista"]) {
        if (!personlista)
            personlista = [[NSMutableArray alloc] init];
        return;
    }
    
    if ( [elementName isEqualToString:@"person"]) {
        if(!currentPerson)
            currentPerson = [[Person alloc] init];
        return;
    }

   }

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    if (!currentStringValue) {
        currentStringValue = [[NSMutableString alloc] initWithCapacity:50];
    }
    [currentStringValue appendString:string];

   }

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
    if ( [elementName isEqualToString:@"personlista"]) return;
    
    if ( 
        [elementName isEqualToString:@"hangar_guid"] || [elementName isEqualToString:@"intressent_id"] || [elementName isEqualToString:@"fodd_ar"] ||
        [elementName isEqualToString:@"kon"] || [elementName isEqualToString:@"sorteringsnamn"] || [elementName isEqualToString:@"parti"] 
        || [elementName isEqualToString:@"valkrets"] || [elementName isEqualToString:@"status"] || [elementName isEqualToString:@"person_url_xml"]
        || [elementName isEqualToString:@"bild_url_80"]
        || [elementName isEqualToString:@"personuppgift"]
        ){
        [currentStringValue release];
        currentStringValue = nil;
    }
    
    
    if([elementName isEqualToString:@"kod"])
    {
        if(!currentKod)
            currentKod = [[NSMutableString alloc] initWithCapacity:50];
        
        
        [currentStringValue replaceOccurrencesOfString:@"\n" withString:@"" options:0 range:NSMakeRange(0,[currentStringValue length])];
        
        
        currentKod = [currentStringValue copy];
        
        [currentStringValue release];
        currentStringValue = nil;
        return;
    }
    
  
    
    if([elementName isEqualToString:@"uppgift"] && [currentKod isEqualToString:@"Webbsida"])
    {
        currentPerson.webbsida = currentStringValue;
        
        [currentStringValue release];
        currentStringValue = nil;
        
        [currentKod release];
        currentKod = nil;
        
        return;
    }
    
    if ( [elementName isEqualToString:@"efternamn"] ) {
        currentPerson.Efternamn = currentStringValue;
        [currentStringValue release];
        currentStringValue = nil;
        return;
    }
    
    if ( [elementName isEqualToString:@"tilltalsnamn"] ) {
        currentPerson.Fornamn = currentStringValue;
        [currentStringValue release];
        currentStringValue = nil;
        return;
    }
    /*
    if ( [elementName isEqualToString:@"bild_url_80"]) {
        //currentPerson.bildurl = currentStringValue;
        [currentStringValue release];
        currentStringValue = nil;
        return;
    }*/
    
    if ( [elementName isEqualToString:@"person"]) {
        [personlista addObject:currentPerson];
        [currentPerson release];
        currentPerson = nil;
        return;
    }  
    
    
    if ( [elementName isEqualToString:@"bild_url_192"] ) {
        currentPerson.bildurl = currentStringValue;
        [currentStringValue release];
        currentStringValue = nil;
        return;
    }  
}

- (void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError {
    
}

- (void)dealloc {
	[personlista release];
    [currentPerson release];
    [currentStringValue release];
    if(!currentKod)
        [currentKod release];
	[super dealloc];
}


@end
