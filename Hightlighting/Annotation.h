//
//  Annotation.h
//  Hightlighting
//
//  Created by Tabbie on 1/9/13.
//  Copyright (c) 2013 Tabbie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "singletonObj.h"

@interface Annotation : UIViewController <UITextFieldDelegate> {
   
   
}

@property IBOutlet UITextField *annotationText;
@property NSInteger numba;

@end
