//
//  EnemyClass.h
//  ProjectGarbage
//
//  Created by Michał Leśniak on 18.06.2013.
//  Copyright 2013 Michał Leśniak. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface EnemyClass : CCLayer {
    CCSprite *_sprite;
    float _velocity;
    int place;
}
-(id) initWithFile:(NSString*) filename :(float) velocity;
-(CCSprite*) getSprite;
-(BOOL) collisionWithPlayer: (CCSprite*) spr;
-(void) setVelocity: (float) velocity;
-(float) getVelocity;
-(BOOL) canDestroy;
-(void) setPos:(float)x :(float)y;
-(void) reset:(NSString*) filename :(float) velocity;
@end
