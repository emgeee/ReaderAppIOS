//
//  NotesViewController.h
//  Hightlighting
//
//  Created by Tabbie on 1/7/13.
//  Copyright (c) 2013 Tabbie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "singletonObj.h"

@interface NotesViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>{
        NSString *box;
  
  
    
}
@property (nonatomic) NSString *box;

@property IBOutlet UITableView *notesAndHightlights;
@property (nonatomic) NSInteger row;

@end
