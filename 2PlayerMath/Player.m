//
//  Player.m
//  2PlayerMath
//
//  Created by Li Pan on 2016-01-18.
//  Copyright © 2016 Li Pan. All rights reserved.
//

#import "Player.h"

@implementation Player

-(instancetype) init {
    self = [super init];
    if (self) {
        _playerLifeLeft = PLAYER_LIVES;
    }
    return self;
}

@end
