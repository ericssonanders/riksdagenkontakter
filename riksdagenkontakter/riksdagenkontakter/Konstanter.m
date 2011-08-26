//
//  Konstanter.m
//  Control Fun
//
//  Created by Anders Ericsson on 2011-02-03.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Konstanter.h"



@implementation Konstanter

static NSString *SIMPLE_TABLE_IDENTIFIER = @"SimpleTableIdentifier";	
static NSString *CUSTOM_CELL_IDENTIFIER = @"CustomCellIdentifier";
static int TABLEVIEW_ROW_HEIGHT = 66;

+(NSString *) getSimpleTableIdentifier{
	return SIMPLE_TABLE_IDENTIFIER;
}

+(NSString *) getCustomCellIdentifier{
	return CUSTOM_CELL_IDENTIFIER;
}

+(int) getTableViewRowHeight{
	return TABLEVIEW_ROW_HEIGHT;
}



@end
