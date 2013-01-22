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
    [myWebView endEditing:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)annotate {
    //increment varibale count
    static int count;
    count= count+1;
    NSLog(@"the increment variable is set to %d", count);
    NSLog(@"annotating");
    
    //change the text to let you know there is an annoation that correlates with it
    [myWebView stringByEvaluatingJavaScriptFromString:@"document.execCommand('underline', false, 'nil')"];
    
    NSString *js= [NSString stringWithFormat:@"pasteHtmlAtCaret(%d);", count];
    
    [myWebView stringByEvaluatingJavaScriptFromString:js];
    
 
    
    [self performSegueWithIdentifier:@"addAnnotation" sender:self];
   }




-(void)darkTheme {
    
    //increment varibale count
    static int count;
    count= count+1;
     NSLog(@"%d", count);
    if (count % 2) {
        NSLog(@"odd");
        [myWebView stringByEvaluatingJavaScriptFromString:@"document.body.style.backgroundColor='#000'"];
        //change the textcolor from black to almost white for the dark scheme
        NSString *jsString = [[NSString alloc] initWithFormat:@"document.body.style.color='#eee'"];
        [myWebView stringByEvaluatingJavaScriptFromString:jsString];
                
        
    } else {
        NSLog(@"even");
        [myWebView stringByEvaluatingJavaScriptFromString:@"document.body.style.backgroundColor='#fff'"];
        //change the textcolor from white to black for light theme
        NSString *jsString = [[NSString alloc] initWithFormat:@"document.body.style.color='#000'"];
        [myWebView stringByEvaluatingJavaScriptFromString:jsString];
    }

    
}


- (void)highlight:(id)sender {
    // Perform the action here. THIS DOES NOT WORK AS I WANT. CRY CRY CRY CRY 
    NSLog(@"i'm calling this action");
   
    
    
    //get selection text so we can store it later
   self.selectionText= [myWebView stringByEvaluatingJavaScriptFromString:@"window.getSelection().toString()"];
   
    //array that holds the highlights
    
    [[singletonObj singleObj].notes setObject:selectionText forKey:@"highlights"];
   
    NSLog(@"%u", [[singletonObj singleObj].notes count]);
    
    NSLog(@"%@", myWebView.backgroundColor);
    //get the current color of the text bkgrd and see if the background color is yellow. aka the text is already highlighted
    NSString *currentColor = [myWebView stringByEvaluatingJavaScriptFromString:@"document.queryCommandValue('backColor')"];
    NSLog(@"%@", currentColor);
    NSString *comparison= @"rgba(0, 0, 0, 0)";
    NSLog(@"the other is %@", comparison);
    if ([currentColor isEqualToString: @"rgb(255, 255, 255)"]) {
        NSLog(@"i'm white, lemme turn pink real quick");
        [myWebView stringByEvaluatingJavaScriptFromString:@"document.execCommand('backColor', false, 'pink')"];
        [myWebView stringByEvaluatingJavaScriptFromString:@"document.execCommand('foreColor', false, 'black')"];
    } else {
        NSLog(@"notWhite");
    }
    if ([currentColor isEqualToString: @"rgb(0, 0, 0)"]) {
        NSLog(@"black");
        [myWebView stringByEvaluatingJavaScriptFromString:@"document.execCommand('backColor', false, 'pink')"];
        [myWebView stringByEvaluatingJavaScriptFromString:@"document.execCommand('foreColor', false, 'black')"];
    } else {
        NSLog(@"notBlack");
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
