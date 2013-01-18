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
@synthesize textOptions;
@synthesize singleTap;
@synthesize selectionText;
@synthesize fontSlider;





-(void) viewDidLoad
{
    
    [super viewDidLoad];
     
    NSURL *indexFileURL = [[NSBundle mainBundle] URLForResource:@"textFile" withExtension:@"html"];
    [myWebView loadRequest:[NSURLRequest requestWithURL:indexFileURL]];
    [myWebView stringByEvaluatingJavaScriptFromString:@"document.body.style.fontFamily='HelveticaNeue, Helvetica'"];
    
        


    //add highlight button and annotate button to uimenu on selection
    UIMenuItem *testMenuItem = [[UIMenuItem alloc] initWithTitle:@"Highlight"  action:@selector(highlight:)];
    UIMenuItem *annotate     = [[UIMenuItem alloc] initWithTitle:@"Annotate"   action:@selector(annotate)];
    [UIMenuController sharedMenuController].menuItems = [NSArray arrayWithObjects:testMenuItem, annotate, nil];
    
    
        
    
   

  
}

-(void) viewDidAppear:(BOOL)animated {
     [self.navigationController setNavigationBarHidden:YES animated:animated];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)annotate {
    NSLog(@"annotating");
    
    //change the text to let you know there is an annoation that correlates with it
    [myWebView stringByEvaluatingJavaScriptFromString:@"document.execCommand('underline', false, 'nil')"];
    
    NSString *strInputJS= [myWebView stringByEvaluatingJavaScriptFromString:@"pasteHtmlAtCaret();"];
    [myWebView stringByEvaluatingJavaScriptFromString:strInputJS];
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
    
    [[singletonObj singleObj].notes addObject:selectionText];
    NSLog(@"%@", [[singletonObj singleObj].notes objectAtIndex:0]);
    NSLog(@"%u", [[singletonObj singleObj].notes count]);
    
    
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
        //vc->viewSelections.notes=selections.notes;
        
    }
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {

    if ([[request.URL absoluteString]compare:@"http://google.com/"] == NSOrderedSame) {
        NSLog(@"%@", [request.URL absoluteString]);
        
        [self performSegueWithIdentifier:@"addAnnotation" sender:self];
        
        return NO;
        
    }
}

-(IBAction)handleSingleTap:(UISwipeGestureRecognizer *)singleTap {
    textOptions.hidden=TRUE;
    NSLog(@"thanks for tapping");
}

-(IBAction)handleSwipeRight:(UISwipeGestureRecognizer *)swipeRight {
    textOptions.hidden=FALSE;
}

-(IBAction)sliderValueChanged:(UISlider *)sender {
    float fontSize=[sender value];
       
    NSString *gsString = [[NSString alloc] initWithFormat:@"document.body.style.fontSize='%fpt'", fontSize];
    [myWebView stringByEvaluatingJavaScriptFromString:gsString];

}




@end
