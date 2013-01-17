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
@synthesize annotations;

+(singletonObj *) singleObj {
    static singletonObj *single=nil;
    @synchronized(self)
    {
        //if the singleton object doesn't already exist, create it 
        if(!single)
        {
            single=[[singletonObj alloc] init];
        }
    }
    //if it does, return itself
    return single;
}

@end
