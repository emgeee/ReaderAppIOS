//
//  NotesViewController.m
//  Hightlighting
//
//  Created by Tabbie on 1/7/13.
//  Copyright (c) 2013 Tabbie. All rights reserved.
//

#import "NotesViewController.h"

@interface NotesViewController ()

@end

@implementation NotesViewController
@synthesize box;
@synthesize notesAndHightlights;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [self.navigationController setNavigationBarHidden:NO animated:YES];
       
    NSInteger size= [[singletonObj singleObj].notes count];
    NSLog(@"%d", size);
    [super viewDidLoad];
    
    
       
  
}
//just for practice
-(void)viewWillAppear:(BOOL)animated
{
    //[self showSingleton].text = anotherString.globalstirng;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
   
    
    return 2;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if(section == 0)
        return @"My HighLights";
    else
        return @"My Notes";

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(section == 0)
         return [[singletonObj singleObj].highlights count];
    else
        return [[singletonObj singleObj].notes count];
       
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"CellIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    //important to have this case in case the cellForRowAtIndexPath returns nil. this says if there is no cell, create one because we have none to resuse 
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        
    }
     NSString *country = [[singletonObj singleObj].highlights objectAtIndex:[indexPath row]];
        NSString *country2 = [[singletonObj singleObj].notes objectAtIndex:[indexPath row]];
    // Configure the cell...
    if(indexPath.section == 0)
    {
       cell.textLabel.text = country;
    }
    else if(indexPath.section == 1)
    {
        cell.textLabel.text = country2;
   
    cell.textLabel.font=[UIFont fontWithName:@"Arial" size:12];
    cell.textLabel.numberOfLines=4;
    
    
    }
    
    return cell;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
