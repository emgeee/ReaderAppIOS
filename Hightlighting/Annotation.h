//
//  Annotation.h
//  Hightlighting
//
//  Created by Tabbie on 1/9/13.
//  Copyright (c) 2013 Tabbie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Annotation : UIViewController <UITextFieldDelegate> {
    NSMutableArray *annotations;
   // UITextView *annotationText;
}

@property IBOutlet UITextField *annotationText;
@property NSMutableArray *annotations;

@end
