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
    NSMutableArray *viewSelections;
    singletonObj * anotherString;
    
}
@property (nonatomic) NSString *box;
@property NSMutableArray *viewSelections;
@property IBOutlet UITableView *notesAndHightlights;

//display singleton value
@property (strong, nonatomic) IBOutlet UILabel *showSingleton;
@end
