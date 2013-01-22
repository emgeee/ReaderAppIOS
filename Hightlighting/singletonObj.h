//
//  singletonObj.h
//  Hightlighting
//
//  Created by Tabbie on 1/17/13.
//  Copyright (c) 2013 Tabbie. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface singletonObj : NSObject
    
@property (nonatomic, retain) NSMutableDictionary *notes;

+(singletonObj *) singleObj;

@end