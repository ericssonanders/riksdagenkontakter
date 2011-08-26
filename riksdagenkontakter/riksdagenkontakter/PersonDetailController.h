//
//  PersonDetailController.h
//  TabBarTest
//
//  Created by Anders Ericsson on 2011-06-19.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Person.h"

@interface PersonDetailController : UIViewController {
    Person *person;
    UILabel *fornamn;
    UILabel *efternamn;
    UIImageView *imageView;
    IBOutlet UIImageView *reflectionView;
    UILabel *webbsida;
}

@property (nonatomic,retain) Person *person;
@property (nonatomic,retain) IBOutlet UILabel *fornamn;
@property (nonatomic,retain) IBOutlet UILabel *efternamn;
@property (nonatomic,retain) IBOutlet  UIImageView *imageView;
@property (nonatomic,retain) IBOutlet UILabel *webbsida;
@property (nonatomic, retain) UIImageView *reflectionView;

- (UIImage *)reflectedImage:(UIImageView *)fromImage withHeight:(NSUInteger)height;
@end
