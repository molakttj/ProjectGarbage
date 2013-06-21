//
//  HouseClass.h
//  ProjectGarbage
//
//  Created by Michał Leśniak on 05.06.2013.
//  Copyright 2013 Michał Leśniak. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface HouseClass : CCLayer {    // Houses to scroll
    CCSprite *_sprite;
    float _velocity;
    BOOL _fromLeftSide;
}
-(id) initWithFile: (NSString*) filename: (CGPoint) lastOne: (CGSize) lastOneSize: (float) velocity: (BOOL) fromLeftSide: (int) percentageOfScreenLine;
-(CCSprite*)getSprite;
-(void) update:(ccTime)delta;
-(void) setVelocity: (float) velocity;
-(float) getVelocity;
@end

