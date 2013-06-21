//
//  HouseClass.m
//  ProjectGarbage
//
//  Created by Michał Leśniak on 05.06.2013.
//  Copyright 2013 Michał Leśniak. All rights reserved.
//

#import "HouseClass.h"
#import "cocos2d.h"


@implementation HouseClass

-(id) initWithFile: (NSString*) filename: (CGPoint) lastOne: (CGSize) lastOneSize: (float) velocity: (BOOL) fromLeftSide: (int) percentageOfScreenLine{             // Constructor
    
    self = [super init];
        CCTexture2D *tx = [[CCTextureCache sharedTextureCache] addImage: filename];
        _sprite = [[CCSprite alloc] init];
        _sprite = [CCSprite spriteWithTexture:tx];
        _sprite.position = ccp(((percentageOfScreenLine * [[CCDirector sharedDirector] winSize].width)/100)-_sprite.contentSize.width/2, (lastOne.y + lastOneSize.height/2) + _sprite.contentSize.height/2); //sprite jest z lewej strony
    
        if (!fromLeftSide){ //Jesli sprite ma byc z prawej strony to flip
            NSLog(@"SPRITE FLIPED");
            _sprite.flipX = -1;
            _sprite.position = ccp(((100-percentageOfScreenLine)/100)*[[CCDirector sharedDirector] winSize].width + _sprite.contentSize.width/2, (lastOne.y + lastOneSize.height/2) + _sprite.contentSize.height/2);
        }
    
        _sprite.visible = YES;
        _velocity = velocity;
        _fromLeftSide = fromLeftSide;
        NSLog(@"ADDED %f %f", _sprite.position.x, _sprite.position.y);
    return self;
}
-(CCSprite*)getSprite{
    return _sprite;
}
-(id)init{
    self = [super init];
    CGPoint nothing = CGPointZero;
    CGSize non = CGSizeZero;
    return [self initWithFile:@"": nothing: non: 0: YES: 10];
}
-(void) update:(ccTime)delta{
    _sprite.position = ccp(_sprite.position.x, _sprite.position.y-_velocity); //Ruch domku w dol zgodnie z podaną prędkością.
}
-(void) setVelocity:(float)velocity{
    _velocity = velocity;
}
-(float) getVelocity{
    return _velocity;
}
@end
