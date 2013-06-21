//
//  EnemyClass.m
//  ProjectGarbage
//
//  Created by Michał Leśniak on 18.06.2013.
//  Copyright 2013 Michał Leśniak. All rights reserved.
//

#import "EnemyClass.h"


@implementation EnemyClass
-(id) initWithFile:(NSString*) filename :(float) velocity
{
    self = [super init];
    CCTexture2D *tx = [[CCTextureCache sharedTextureCache] addImage: filename];
    _sprite = [[CCSprite alloc] init];
    _sprite = [CCSprite spriteWithTexture:tx];
    place = arc4random()%3;
    _sprite.position = ccp(50*2 + place*50, [[CCDirector sharedDirector] winSize].height+_sprite.contentSize.height);
    _sprite.visible = YES;
    NSLog(@"Enemy added at: %f %f", _sprite.position.x, _sprite.position.y);
    _velocity = velocity;
    return self;
}
-(CCSprite*)getSprite{
    return _sprite;
}
-(BOOL) collisionWithPlayer:(CCSprite *)spr{
    if(CGRectIntersectsRect([spr boundingBox], [_sprite boundingBox])){
        return YES;
        NSLog(@"COLLISION");
    }
    return NO;
}
-(void) setVelocity:(float)velocity{
    _velocity = velocity;
}
-(float) getVelocity{
    return _velocity;
}
-(BOOL) canDestroy{
    if (_sprite.position.y < 0 - _sprite.contentSize.height)
        return YES;
    return NO;
}
-(void) update:(ccTime)delta{
    _sprite.position = ccp(_sprite.position.x, _sprite.position.y - _velocity);
}
-(void) setPos:(float)x :(float)y{
    _sprite.position = ccp(x,y);
}
-(void) reset:(NSString*) filename :(float) velocity{
    [_sprite setTexture:[[CCTextureCache sharedTextureCache] addImage:filename]];
    place = arc4random()%3;
    _sprite.position = ccp(50*2 + place*50, [[CCDirector sharedDirector] winSize].height+_sprite.contentSize.height);
    _sprite.visible = YES;
    NSLog(@"Enemy added at: %f %f", _sprite.position.x, _sprite.position.y);
    _velocity = velocity;
}

@end
