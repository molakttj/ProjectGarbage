//
//  DumpsterClass.h
//  ProjectGarbage
//
//  Created by Michał Leśniak on 06.06.2013.
//  Copyright 2013 Michał Leśniak. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface DumpsterClass : CCLayer {
    CCSprite* _sprite;
    CGPoint vel;
    CGPoint pos;
}
-(id) initWithFile: (NSString*) filename;
-(CCSprite*) getSprite;
-(void) accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration;
@end
