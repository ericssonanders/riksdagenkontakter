//
//  SearchResultController2.m
//  TabBarTest
//
//  Created by Anders Ericsson on 2011-06-05.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "SearchResultController2.h"
#import "RiksdagenServiceAgent.h"
#import "CustomCell.h"
#import "Konstanter.h"
//#import "ProtocolDokument.h"
#import "PersonProtocol.h"
#import "QueryBuilder.h"
#import "ASIHTTPRequest.h"
#import "XmlParser.h"
#import "riksdagenkontakterAppDelegate.h"
#import "RiksdagenServiceAgent.h"

@implementation SearchResultController2

@synthesize list;
@synthesize fornamn;
@synthesize efternamn;
@synthesize personlista;
@synthesize currentPerson;
@synthesize currentStringValue;
@synthesize newSearch;
@synthesize personDetailController;
@synthesize progressView;
@synthesize progressView2;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc
{
    [list release];
    [fornamn release];
    [efternamn release];
    [personlista release];
    [currentPerson release];
    [currentStringValue release];
    [personDetailController release];
    [progressView release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    
    
    
    [super viewDidLoad];

  

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidUnload
{
    
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    
    
    
    if(!newSearch)
        return;
    newSearch = !newSearch;
    
    if(self.list){
        [self.list release];
    }
    
    //[[self tableView] setHidden:YES];
    //[[self progressView] setHidden:NO];
    
    //QueryBuilder *queryBuilder =  [[QueryBuilder alloc] init];
    //[queryBuilder inititialize:self.fornamn];
    
    
    NSString *url = @"http://data.riksdagen.se/personlista/?utformat=xml";
    NSString *forNamnqryString = [[NSString alloc] initWithFormat:@"&fnamn=%@&enamn=%@", self.fornamn,self.efternamn];
    NSString *searchURL = [url stringByAppendingString:forNamnqryString];
    
    
    
    //ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:[NSURL URLWithString: searchURL ]];
    //request d
    //[request startAsynchronous];
    
    
    RiksdagenServiceAgent *service = [[RiksdagenServiceAgent alloc] init];
    [service makeRequest:[NSURL URLWithString: searchURL] delegate:self delegateProgress:self];
    [service release];

    UIView *view = [[UIView alloc] init];
    view.frame = self.tableView.frame;
    progressView2 = view;
    
    UIActivityIndicatorView *ac = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    CGRect frame = view.frame;
    ac.center = CGPointMake(frame.size.width/2, frame.size.height/2);
    [view addSubview:ac];
    [ac startAnimating];
    [ac release];
    
    [self.tableView addSubview:view];
    [view release];
    
    //NSError *error = [request error];
    //if (!error) {
    //    xmlString = [request responseString];
    //}
    
    //[queryBuilder release];
    //queryBuilder = nil;
    
    
       
    
        
       
    [super viewWillAppear:animated];
}

- (void)setProgress:(float)progress
{
    currentProgress = progress;
    [progressView setProgress:progress];
}

- (void)requestFinished:(ASIHTTPRequest *)request
{
    
    [progressView2 removeFromSuperview];
    NSString *requestString = [request responseString];
    
    NSXMLParser *xmlParser = [[NSXMLParser alloc] initWithData: [requestString dataUsingEncoding:NSUTF8StringEncoding]];
    
    XmlParser *xmlParserDelegate = [[XmlParser alloc] init];
    [xmlParser setDelegate: xmlParserDelegate];
    [xmlParser setShouldResolveExternalEntities:NO];
    [xmlParser parse];

    
    list = [[NSMutableArray alloc] init];
	self.list = [xmlParserDelegate personlista];
    
    [personlista release];
    personlista = nil;

    
    [xmlParserDelegate release];
    [xmlParser release];
    [[self progressView] setHidden:YES];
    [[self tableView] setHidden:NO];
    [[self tableView] reloadData];
}

- (void)requestFailed:(ASIHTTPRequest *)request
{
    
}

- (void)viewDidAppear:(BOOL)animated
{
    
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
  
    [super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    // Return the number of rows in the section.
    return list.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
        
        CustomCell *cell = (CustomCell *)[tableView dequeueReusableCellWithIdentifier: Konstanter.getCustomCellIdentifier];
        
        if (cell == nil)
        {
            NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"CustomCell" owner:self options:nil];
            for (id o in nib){
                if([o isKindOfClass:[CustomCell class]])
                    cell = (CustomCell *)o;
            }
        }
        
        NSUInteger row = [indexPath row];
        
        id o = [list objectAtIndex: row];
        
        if([o conformsToProtocol:@protocol(PersonProtocol)]){
            cell.titel.text = [o Fornamn];
            cell.undertitel.text = [o Efternamn];
            cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
        }
        return cell;
    
    
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *) indexPath{
	return Konstanter.getTableViewRowHeight;
}

-(void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath{
    if(personDetailController){
        [personDetailController release];
        personDetailController = nil;
    }
    
    
    if(!personDetailController)
    {
        PersonDetailController *apersonDetailController = [[PersonDetailController alloc] initWithNibName:@"PersonDetailController" bundle:nil];
        self.personDetailController = apersonDetailController;
        [apersonDetailController release];
    }
    int row = [indexPath row];
    personDetailController.person = (Person *)[list objectAtIndex: row];
    riksdagenkontakterAppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    [delegate.navController pushViewController: self.personDetailController animated:YES];
	
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     [detailViewController release];
     */
}

- (NSDictionary *) downloadRiksdagenStuff 
{
    //QueryBuilder *queryBuilder = [[QueryBuilder alloc] init];
    //[queryBuilder inititialize:self.fornamn];
	//NSString *url = @"http://data.riksdagen.se/personlista/?utformat=json&fnamn=phia";
    
    //NSString *jsonString = [self makeSearch: [NSURL URLWithString:queryBuilder.baseURL]];
    //RiksdagenServiceAgent *serviceAgent = [[RiksdagenServiceAgent alloc] init];
	//NSString *jsonString = [serviceAgent makeSynchronizedRequest2:[NSURL URLWithString:url]];
	//[serviceAgent release];
	/*
	SBJsonParser *jsonParser = [SBJsonParser new];
	id response = [jsonParser objectWithString:jsonString error:NULL];
	[jsonParser release];
	
	return (NSDictionary *)response;
*/
    return nil;
     }

- (NSString *) makeSearch : (NSURL *)url{
	/*
    RiksdagenServiceAgent *serviceAgent = [[RiksdagenServiceAgent alloc] init];
	NSString *result = [serviceAgent makeSynchronizedRequest2:url];
	[serviceAgent release];
	return result;
     */
    return nil;
}


@end
