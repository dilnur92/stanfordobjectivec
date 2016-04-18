//
//  CardMatchingGame.h
//  Card
//
//  Created by Dilnur Yuldashev on 4/18/16.
//  Copyright © 2016 Dilnur Yuldashev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"

@interface CardMatchingGame : NSObject
-(instancetype)initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck;
-(void) chooseCardAtIndex:(NSUInteger)index;
@property (nonatomic, readonly) NSInteger score;
-(Card *) cardAtIndex:(NSUInteger)index;
@end
