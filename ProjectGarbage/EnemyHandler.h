//
//  EnemyHandler.h
//  ProjectGarbage
//
//  Created by Michał Leśniak on 20.06.2013.
//  Copyright 2013 Michał Leśniak. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#ifdef __cplusplus
#include <vector>
#endif
@interface EnemyHandler : CCLayer {
    struct tile {int l; int m; int r;};
#ifdef __cplusplus
    std::vector<tile> vecEnemies;
#endif

}
-(void) nextRow;
-(void) getLastRow;

@end
