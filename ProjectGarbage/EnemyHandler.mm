//
//  EnemyHandler.m
//  ProjectGarbage
//
//  Created by Michał Leśniak on 20.06.2013.
//  Copyright 2013 Michał Leśniak. All rights reserved.
//

#import "EnemyHandler.h"


@implementation EnemyHandler
-(void) nextRow
{
    tile tmp;
    tmp.l = 0;
    tmp.m = 0;
    tmp.r = 0;
    
    if (vecEnemies.empty()){
        vecEnemies.push_back(tmp);
        vecEnemies.push_back(tmp);
    }
    
    int nxt = arc4random()%2;
    
    if (nxt == 0)
        tmp.l = 0;
    else{
        if (vecEnemies[vecEnemies.size()-1].l == 0 && vecEnemies[vecEnemies.size()-2].l == 0 && vecEnemies[vecEnemies.size()-1].r == 0 && vecEnemies[vecEnemies.size()-2].r == 0 && vecEnemies[vecEnemies.size()-1].m == 0 && vecEnemies[vecEnemies.size()-2].m == 0)
            tmp.l = 1;
        else
            tmp.l = 0;
    }

    nxt = arc4random()%2;
    
    if (nxt == 0)
        tmp.m = 0;
    else{
        if (vecEnemies[vecEnemies.size()-1].m == 0 && vecEnemies[vecEnemies.size()-2].m == 0 && ((vecEnemies[vecEnemies.size()-1].l == 0 && vecEnemies[vecEnemies.size()-2].l == 0) || (vecEnemies[vecEnemies.size()-1].r == 0 && vecEnemies[vecEnemies.size()-2].r == 0)))
            tmp.m = 1;
        else
            tmp.m = 0;
    }
    
    nxt = arc4random()%2;
    
    if (nxt == 0)
        tmp.r = 0;
    else{
         if (vecEnemies[vecEnemies.size()-1].r == 0 && vecEnemies[vecEnemies.size()-2].r == 0 && !(tmp.l == 1 && tmp.m == 1) && vecEnemies[vecEnemies.size()-1].l == 0 && vecEnemies[vecEnemies.size()-2].l == 0 && vecEnemies[vecEnemies.size()-1].m == 0 && vecEnemies[vecEnemies.size()-2].m == 0)
             tmp.r = 1;
         else
             tmp.r = 0;
    }
    
    printf("%d%d%d\n", tmp.l, tmp.m, tmp.r);
    
    vecEnemies.push_back(tmp);
    
}
-(tile) getLastRow
{
    return vecEnemies[vecEnemies.size()-1];
}
@end
