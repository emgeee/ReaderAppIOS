//
//  singletonObj.m
//  Hightlighting
//
//  Created by Tabbie on 1/17/13.
//  Copyright (c) 2013 Tabbie. All rights reserved.
//

#import "singletonObj.h"

@implementation singletonObj

@synthesize notes;


+(singletonObj *) singleObj {
    static dispatch_once_t pred;
    static singletonObj *shared = nil;
    dispatch_once(&pred, ^{
        shared = [[singletonObj alloc] init];
        shared.notes = [[NSMutableDictionary alloc]init];
    });
    return shared;
}

@end
