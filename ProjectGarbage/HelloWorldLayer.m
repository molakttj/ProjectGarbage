//
//  HelloWorldLayer.m
//  ProjectGarbage
//
//  Created by Michał Leśniak on 05.06.2013.
//  Copyright Michał Leśniak 2013. All rights reserved.
//


// Import the interfaces
#import "HelloWorldLayer.h"
#import "CCTouchDispatcher.h"
#import "HouseClass.h"
#import "DumpsterClass.h"
#import "EnemyClass.h"
#import "EnemyHandler.h"

// Needed to obtain the Navigation Controller
#import "AppDelegate.h"

#pragma mark - HelloWorldLayer

@class HouseClass;

HouseClass* testHouse[2];
DumpsterClass* testDumpster;
EnemyClass* testEnemy[10];
EnemyHandler *singleHandler;


// HelloWorldLayer implementation
@implementation HelloWorldLayer

// Helper class method that creates a Scene with the HelloWorldLayer as the only child.
+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	HelloWorldLayer *layer = [HelloWorldLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

// on "init" you need to initialize your instance
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super's" return value
	if( (self=[super init]) ) {
		
		/*// create and initialize a Label
		CCLabelTTF *label = [CCLabelTTF labelWithString:@"Hello World" fontName:@"Marker Felt" fontSize:64];

		// ask director for the window size
		CGSize size = [[CCDirector sharedDirector] winSize];
	
		// position the label on the center of the screen
		label.position =  ccp( size.width /2 , size.height/2 );
		
		// add the label as a child to this Layer
		[self addChild: label];
		
		
		
		//
		// Leaderboards and Achievements
		//
		
		// Default font size will be 28 points.
		[CCMenuItemFont setFontSize:28];
		
		// to avoid a retain-cycle with the menuitem and blocks
		__block id copy_self = self;
		
		// Achievement Menu Item using blocks
		CCMenuItem *itemAchievement = [CCMenuItemFont itemWithString:@"Achievements" block:^(id sender) {
			
			
			GKAchievementViewController *achivementViewController = [[GKAchievementViewController alloc] init];
			achivementViewController.achievementDelegate = copy_self;
			
			AppController *app = (AppController*) [[UIApplication sharedApplication] delegate];
			
			[[app navController] presentModalViewController:achivementViewController animated:YES];
			
			[achivementViewController release];
		}];
		
		// Leaderboard Menu Item using blocks
		CCMenuItem *itemLeaderboard = [CCMenuItemFont itemWithString:@"Leaderboard" block:^(id sender) {
			
			
			GKLeaderboardViewController *leaderboardViewController = [[GKLeaderboardViewController alloc] init];
			leaderboardViewController.leaderboardDelegate = copy_self;
			
			AppController *app = (AppController*) [[UIApplication sharedApplication] delegate];
			
			[[app navController] presentModalViewController:leaderboardViewController animated:YES];
			
			[leaderboardViewController release];
		}];

		
		CCMenu *menu = [CCMenu menuWithItems:itemAchievement, itemLeaderboard, nil];
		
		[menu alignItemsHorizontallyWithPadding:20];
		[menu setPosition:ccp( size.width/2, size.height/2 - 50)];
		
		// Add the menu to the layer
		[self addChild:menu];*/
        
        testHouse[0] = [[HouseClass alloc] initWithFile:@"reverseButtonOFF.png" :CGPointZero :CGSizeZero :1 :YES: 20];
        [self addChild:[testHouse[0] getSprite]];
        testHouse[1] = [[HouseClass alloc] initWithFile:@"Icon.png" :[testHouse[0] getSprite].position :[testHouse[0] getSprite].contentSize :1 :YES: 20];
        [self addChild:[testHouse[1] getSprite]];
        
        testDumpster = [[DumpsterClass alloc] initWithFile:@"Grafika/smieciara/smieciara.png"];
        [self addChild:[testDumpster getSprite]];
        
        for (int i = 0; i < 10; i++)
        {
            testEnemy[i] = [[EnemyClass alloc] initWithFile:@"Grafika/smieciara/smieciara.png": [testHouse[0] getVelocity]];
            [testEnemy[i] setPos:[testEnemy[i] getSprite].position.x :[testEnemy[i] getSprite].position.y + (118*2)*i];
            [self addChild:[testEnemy[i] getSprite]];
        }
        
        singleHandler = [[EnemyHandler alloc] init];
        for (int i = 0; i < 100; i++)
            [singleHandler nextRow];
        
        CGSize size = [[CCDirector sharedDirector] winSize];
        self.TouchEnabled = YES;
        self.AccelerometerEnabled = YES;
        [self schedule:@selector(nextFrame:)];
	}
	return self;
}
-(void) enemyHandler: (int) k{
    if ([testEnemy[k] canDestroy]){
        NSLog(@"HIHI");
    [testEnemy[k] reset:@"Grafika/smieciara/smieciara.png" :[testEnemy[k] getVelocity]];
    }
}

- (void) nextFrame: (ccTime)dt //Main loop
{
    [testHouse[0] update:dt];
    [testHouse[1] update:dt];
    [testDumpster update:dt];
    
    for (int i = 0; i < 10; i++)
    {
        if (testEnemy[i]){
            [testEnemy[i] update:dt];
            
            if ([testEnemy[i] collisionWithPlayer:[testDumpster getSprite]]){
            [self pauseSchedulerAndActions];
            }
            
            [self enemyHandler: i];
        }
    }
}


// on "dealloc" you need to release all your retained objects
- (void) dealloc
{

    
	[super dealloc];
}

-(void) registerWithTouchDispatcher
{
	[[[CCDirector sharedDirector] touchDispatcher] addTargetedDelegate:self priority:0 swallowsTouches:YES];
}


- (BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event
{
    return YES;
}
- (void)ccTouchMoved:(UITouch *)touch withEvent:(UIEvent *)event
{

}
- (void)ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event
{

}
-(void) accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration
{
    [testDumpster accelerometer:accelerometer didAccelerate:acceleration];
}

#pragma mark GameKit delegate

-(void) achievementViewControllerDidFinish:(GKAchievementViewController *)viewController
{
	AppController *app = (AppController*) [[UIApplication sharedApplication] delegate];
	[[app navController] dismissModalViewControllerAnimated:YES];
}

-(void) leaderboardViewControllerDidFinish:(GKLeaderboardViewController *)viewController
{
	AppController *app = (AppController*) [[UIApplication sharedApplication] delegate];
	[[app navController] dismissModalViewControllerAnimated:YES];
}
@end
