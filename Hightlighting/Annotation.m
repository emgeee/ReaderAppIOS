//
//  Annotation.m
//  Hightlighting
//
//  Created by Tabbie on 1/9/13.
//  Copyright (c) 2013 Tabbie. All rights reserved.
//

#import "Annotation.h"
#import "NotesViewController.h"

@interface Annotation ()

@end

@implementation Annotation
@synthesize annotationText;

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
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    
      
   // addedNotes.annotations=[[NSMutableArray alloc] init];

	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (BOOL)textFieldShouldBeginEditing:(UITextField *)annotationText {
    NSLog(@"textFieldShouldBeginEditing");
    annotationText.backgroundColor = [UIColor colorWithRed:220.0f/255.0f green:220.0f/255.0f blue:220.0f/255.0f alpha:1.0f];
    return YES;
}
- (void)textFieldDidBeginEditing:(UITextField *)annotationText {
    NSLog(@"textFieldDidBeginEditing");
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
	[annotationText resignFirstResponder];
	return YES;
}

-(void)textFieldDidEndEditing:(UITextField *)textField {
    NSLog(@"ended now");
    NSString *annotationInput= annotationText.text;
    NSLog(@"%@",annotationInput);
   [[singletonObj singleObj].notes addObject:annotationInput];
   NSLog(@"%d", [[singletonObj singleObj].notes count]);
    [self.navigationController popToRootViewControllerAnimated:TRUE];
    
    }
@end
