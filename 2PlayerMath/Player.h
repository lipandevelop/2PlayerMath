//
//  Player.h
//  2PlayerMath
//
//  Created by Li Pan on 2016-01-18.
//  Copyright © 2016 Li Pan. All rights reserved.
//

#define PLAYER_LIVES 3

#import <Foundation/Foundation.h>

@interface Player : NSObject

@property (nonatomic, assign) int playerLifeLeft;
@property (nonatomic, strong) NSString *playerName;

@end
