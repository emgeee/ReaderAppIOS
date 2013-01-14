//
//  ViewController.h
//  Hightlighting
//
//  Created by Tabbie on 12/27/12.
//  Copyright (c) 2012 Tabbie. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface ViewController : UIViewController {
    NSMutableArray *selections;
}
      
    
@property IBOutlet UIWebView *myWebView;
@property IBOutlet UIBarButtonItem *textBiggerButton;
@property IBOutlet UIBarButtonItem *textSmallerButton;
@property (nonatomic, retain) IBOutlet UIToolbar *textOptions;
@property IBOutlet UISwipeGestureRecognizer *singleTap;
@property IBOutlet UISwipeGestureRecognizer *swipeRight;
@property NSString *selectionText;
@property NSMutableArray *selections;



-(IBAction) increaseFont;
-(IBAction) changeFont;
-(IBAction) darkTheme;
@end

