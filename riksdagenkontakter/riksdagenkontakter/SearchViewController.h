//
//  SearchViewController.h
//  TabBarTest
//
//  Created by Anders Ericsson on 2011-06-04.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SearchResultController2;

@interface SearchViewController : UIViewController {
    UILabel *lbl;
    UIButton *btn;
    UITextField *tfFornamn;
    UITextField *tfEfternamn;
    SearchResultController2 *searchResultController;
}

@property (nonatomic, retain) IBOutlet UILabel *lbl;
@property (nonatomic, retain) IBOutlet UIButton *btn;
@property (nonatomic, retain) IBOutlet UITextField *tfFornamn;
@property (nonatomic, retain) IBOutlet UITextField *tfEfternamn;
@property (nonatomic, retain) IBOutlet SearchResultController2 *searchResultController;

-(IBAction)buttonPressed;

@end
