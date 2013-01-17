//
//  singletonObj.h
//  Hightlighting
//
//  Created by Tabbie on 1/17/13.
//  Copyright (c) 2013 Tabbie. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface singletonObj : NSObject
    
@property (nonatomic, retain) NSMutableArray *notes;
@property (nonatomic, retain) NSMutableArray *annotations;

+(singletonObj *) singleObj;

@end