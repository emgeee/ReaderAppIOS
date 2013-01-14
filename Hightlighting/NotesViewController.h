//
//  NotesViewController.h
//  Hightlighting
//
//  Created by Tabbie on 1/7/13.
//  Copyright (c) 2013 Tabbie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NotesViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>{
        NSString *box;
    NSMutableArray *viewSelections;
}
@property (nonatomic) NSString *box;
@property NSMutableArray *viewSelections;
@property IBOutlet UITableView *notesAndHightlights;
@end
