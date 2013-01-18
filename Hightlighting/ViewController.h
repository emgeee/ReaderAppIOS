//
//  ViewController.h
//  Hightlighting
//
//  Created by Tabbie on 12/27/12.
//  Copyright (c) 2012 Tabbie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "singletonObj.h"



@interface ViewController : UIViewController <UIWebViewDelegate>  {
    
}
      
    
@property IBOutlet UIWebView *myWebView;
@property (nonatomic, retain) IBOutlet UIToolbar *textOptions;
@property IBOutlet UISwipeGestureRecognizer *singleTap;
@property IBOutlet UISwipeGestureRecognizer *swipeRight;
@property NSString *selectionText;
@property IBOutlet UISlider *fontSlider;



-(IBAction) darkTheme;

//just for shits
-(IBAction)addToSingleton:(id)sender;


//these actions deal with the font slider 
- (IBAction) sliderValueChanged:(id)sender;
- (IBAction) changeButtonPressed:(id)sender;

@end

