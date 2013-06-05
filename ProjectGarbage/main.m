//
//  main.m
//  ProjectGarbage
//
//  Created by Andrzej Leśniak on 05.06.2013.
//  Copyright Andrzej Leśniak 2013. All rights reserved.
//

#import <UIKit/UIKit.h>

int main(int argc, char *argv[]) {
    
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
    int retVal = UIApplicationMain(argc, argv, nil, @"AppController");
    [pool release];
    return retVal;
}
