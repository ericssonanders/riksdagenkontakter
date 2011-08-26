//
//  CustomCell.h
//  Control Fun
//
//  Created by Anders Ericsson on 2011-02-03.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface CustomCell : UITableViewCell {
	IBOutlet UILabel *titel;
	IBOutlet UILabel *undertitel;
}

@property(nonatomic,retain) UILabel *titel;
@property(nonatomic,retain) UILabel *undertitel;


@end
