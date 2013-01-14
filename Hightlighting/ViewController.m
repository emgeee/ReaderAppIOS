//
//  ViewController.m
//  Hightlighting
//
//  Created by Tabbie on 12/27/12.
//  Copyright (c) 2012 Tabbie. All rights reserved.
//

#import "ViewController.h"
#import "NotesViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize myWebView;
@synthesize textBiggerButton;
@synthesize textSmallerButton;
@synthesize textOptions;
@synthesize singleTap;
@synthesize selectionText;
@synthesize selections;




-(void) viewDidLoad
{
    
    [super viewDidLoad];
     
    NSURL *indexFileURL = [[NSBundle mainBundle] URLForResource:@"textFile" withExtension:@"html"];
    [myWebView loadRequest:[NSURLRequest requestWithURL:indexFileURL]];
    
        


    //add highlight button and annotate button to uimenu on selection
    UIMenuItem *testMenuItem = [[UIMenuItem alloc] initWithTitle:@"Highlight"  action:@selector(highlight:)];
    UIMenuItem *annotate     = [[UIMenuItem alloc] initWithTitle:@"Annotate"   action:@selector(annotate)];
    [UIMenuController sharedMenuController].menuItems = [NSArray arrayWithObjects:testMenuItem, annotate, nil];
    selections=[[NSMutableArray alloc] init];
    
    //make JS calls
    
   

  
}

-(void) viewDidAppear:(BOOL)animated {
     [self.navigationController setNavigationBarHidden:YES animated:animated];
}

- (IBAction)changeTextFontSize:(id)sender;

{   //set font size and min and max text values
    static int textFontSize;
    int MyTextSizeMin = 12;
    int MyTextSizeMax = 100;
    
    // disable buttons when they're out of the range.
    BOOL smallerEnabled = textFontSize > MyTextSizeMin;
    BOOL biggerEnabled = textFontSize < MyTextSizeMax;
    
    
    
    //increment or decrement value of textFontSize depending on which button is pressed 
    if ([sender tag]==1) {
        NSLog(@"1+");
      int  difference=2;
        textFontSize=textFontSize+difference;
          [textBiggerButton setEnabled:biggerEnabled];
       
    } else {
        NSLog(@" -");
        int difference=-2;
        textFontSize=textFontSize+difference;
         [textSmallerButton setEnabled:smallerEnabled];
      

    }
    
    NSLog(@"%d", textFontSize);

    NSString *jsString = [[NSString alloc] initWithFormat:@"document.body.style.fontSize='%dpt'",
                          textFontSize];
    [myWebView stringByEvaluatingJavaScriptFromString:jsString];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)annotate {
    NSLog(@"annotating");
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:@"AnnotationLogo.png"] forState:UIControlStateNormal];
    [button addTarget:self
               action:@selector(addNote:)
     forControlEvents:UIControlEventTouchDown];
    
    
    [myWebView addSubview:button];
    
    //change the text to let you know there is an annoation that correlates with it
    [myWebView stringByEvaluatingJavaScriptFromString:@"document.execCommand('underline', false, 'nil')"];
    
    CGRect selectedTextFrame = CGRectFromString([myWebView stringByEvaluatingJavaScriptFromString:@"getRectForSelectedText()"]);

    NSLog(@"%@", NSStringFromCGRect(selectedTextFrame));
    
    [button setTitle:@"Annotation" forState:UIControlStateNormal];
    button.frame = CGRectMake(270.0, selectedTextFrame.origin.y, 50.0, 50.0);
   }
-(IBAction)addNote:(id)sender {
    [self performSegueWithIdentifier:@"addAnnotation" sender:sender];
}
-(void)increaseFont {
    //increment varibale count
    static float count;
    count= count+1;
    NSInteger fontSize = 10+count;
    NSString *gsString = [[NSString alloc] initWithFormat:@"document.body.style.fontSize='%dpt'", fontSize];
    [myWebView stringByEvaluatingJavaScriptFromString:gsString];
}


-(void)changeFont {
    //increment varibale count
    static float count;
    count= count+1;
    NSInteger fontSize = 10+count;
    NSString *gsString = [[NSString alloc] initWithFormat:@"document.body.style.fontSize='%dpt'", fontSize];
    [myWebView stringByEvaluatingJavaScriptFromString:gsString];
}

-(void)darkTheme {
    
    //increment varibale count
    static int count;
    count= count+1;
     NSLog(@"%d", count);
    if (count % 2) {
        NSLog(@"odd");
        myWebView.backgroundColor= [UIColor colorWithRed:(12/255.0) green:(12/255.0) blue:(12/255.0) alpha:1];
        //change the textcolor from black to almost white for the dark scheme
        NSString *jsString = [[NSString alloc] initWithFormat:@"document.body.style.color='#eee'"];
        [myWebView stringByEvaluatingJavaScriptFromString:jsString];
        
        
    } else {
        NSLog(@"even");
         myWebView.backgroundColor= [UIColor colorWithRed:(255.0/255.0) green:(255.0/255.0) blue:(255.0/255.0) alpha:1];
        //change the textcolor from white to black for light theme 
        NSString *jsString = [[NSString alloc] initWithFormat:@"document.body.style.color='#000'"];
        [myWebView stringByEvaluatingJavaScriptFromString:jsString];
    }

    
}


- (void)highlight:(id)sender {
    // Perform the action here. THIS DOES NOT WORK AS I WANT. CRY CRY CRY CRY 
    NSLog(@"i'm calling this action");
    [myWebView stringByEvaluatingJavaScriptFromString:@"document.execCommand('foreColor', false, 'black')"];
    
    
    //get selection text so we can store it later
   self.selectionText= [myWebView stringByEvaluatingJavaScriptFromString:@"window.getSelection().toString()"];
   
    //array that holds the highlights
    
    [selections addObject:selectionText];
    NSLog(@"%@", [selections objectAtIndex:0]);
    
    
    //get the current color of the text bkgrd and see if the background color is yellow. aka the text is already highlighted
    NSString *currentColor = [myWebView stringByEvaluatingJavaScriptFromString:@"document.queryCommandValue('backColor')"];
    if ([currentColor isEqualToString:@"rgb(0, 0, 0)"]) {
        [myWebView stringByEvaluatingJavaScriptFromString:@"document.execCommand('backColor', false, 'transparent')"];
        NSLog(@"i'm highlighted");
    } else {
        [myWebView stringByEvaluatingJavaScriptFromString:@"document.execCommand('foreColor', false, 'black')"];
        [myWebView stringByEvaluatingJavaScriptFromString:@"document.execCommand('backColor', false, 'pink')"];
        [myWebView resignFirstResponder];
    }
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"viewNotes"]) {
        NSLog(@"yes");
        // Get destination view
        NotesViewController *vc = [segue destinationViewController];
        vc.viewSelections=selections;
        
    }
}




-(IBAction)handleSingleTap:(UISwipeGestureRecognizer *)singleTap {
    textOptions.hidden=TRUE;
    NSLog(@"thanks for tapping");
}

-(IBAction)handleSwipeRight:(UISwipeGestureRecognizer *)swipeRight {
    textOptions.hidden=FALSE;
}


@end
