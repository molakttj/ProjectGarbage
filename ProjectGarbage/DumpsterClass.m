//
//  DumpsterClass.m
//  ProjectGarbage
//
//  Created by Michał Leśniak on 06.06.2013.
//  Copyright 2013 Michał Leśniak. All rights reserved.
//

#import "DumpsterClass.h"

#define kHeroMovementAction 1
#define kPlayerSpeed 100

@implementation DumpsterClass
-(id) initWithFile: (NSString*) filename
{
    self = [super init];
    CCTexture2D *tx = [[CCTextureCache sharedTextureCache] addImage: filename];
    _sprite = [[CCSprite alloc] init];
    _sprite = [CCSprite spriteWithTexture:tx];
    _sprite.position = ccp([[CCDirector sharedDirector] winSize].width/2, [[CCDirector sharedDirector] winSize].height/4); //sprite jest z lewej strony
    self.AccelerometerEnabled = YES;
    _sprite.visible = YES;
    NSLog(@"Dumpster added at: %f %f", _sprite.position.x, _sprite.position.y);
    [self setAccelerometerEnabled:YES];
    return self;
}
-(CCSprite*)getSprite{
    return _sprite;
}

-(void) accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration
{
   // NSLog(@"WBIŁO");
    float deceleration = 0.1f, sensitivity = 8.0f, maxVelocity = 150;
    
    // adjust velocity based on current accelerometer acceleration
    vel.x = vel.x * deceleration + acceleration.x * sensitivity;
    
    //limit the maximum velocity of the player sprite, in both directions (positive & negative values)
    vel.x = fmaxf(fminf(vel.x, maxVelocity), -maxVelocity);
}
-(void) update:(ccTime)delta
{
    CGSize screenSize = [[CCDirector sharedDirector] winSize];
    float imageWidthHalved = [_sprite texture].contentSize.width * 0.25f;
    float leftBorderLimit = imageWidthHalved + 45;
    float rightBorderLimit = screenSize.width - imageWidthHalved - 45;
    
    pos = _sprite.position;
    pos.x += vel.x;
    
    if (pos.x < leftBorderLimit)
    {
        pos.x = leftBorderLimit;
        vel = CGPointZero;
    }
    else if (pos.x > rightBorderLimit)
    {
        pos.x = rightBorderLimit;
        vel = CGPointZero;
    }
    
    _sprite.position = pos;
}@end
