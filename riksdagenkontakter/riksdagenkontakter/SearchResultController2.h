//
//  SearchResultController2.h
//  TabBarTest
//
//  Created by Anders Ericsson on 2011-06-05.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Person.h"
#import "PersonDetailController.h"


@interface SearchResultController2  : UITableViewController {
    NSMutableArray *list;
    NSString *fornamn;
    NSString *efternamn;
    NSMutableArray *personlista;
    Person *currentPerson;
    NSMutableString *currentStringValue;
    bool newSearch;
    PersonDetailController *personDetailController;
    UIProgressView *progressView;
    float currentProgress;
    UIView *progressView2;
}


@property (nonatomic, retain) IBOutlet NSMutableArray *list;
@property (nonatomic, retain) NSString *fornamn;
@property (nonatomic, retain) NSString *efternamn;
@property (nonatomic, retain) NSMutableArray *personlista;
@property (nonatomic, retain) Person *currentPerson;
@property (nonatomic, retain) NSMutableString *currentStringValue;
@property (nonatomic) bool newSearch;
@property (nonatomic, retain) PersonDetailController *personDetailController;
@property (nonatomic, retain) IBOutlet UIProgressView *progressView;
@property (nonatomic, retain) IBOutlet UIView *progressView2;


- (NSDictionary *) downloadRiksdagenStuff;
- (NSString *) makeSearch : (NSURL *)url;
@end
