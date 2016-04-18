//
//  PlayingCard.h
//  Card
//
//  Created by Dilnur Yuldashev on 4/18/16.
//  Copyright © 2016 Dilnur Yuldashev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface PlayingCard : Card
@property (strong, nonatomic) NSString * suit;
@property (nonatomic) NSUInteger rank;
+(NSArray *) validSuits;
+(NSUInteger) maxRank;
@end
