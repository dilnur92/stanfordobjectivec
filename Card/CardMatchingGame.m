//
//  CardMatchingGame.m
//  Card
//
//  Created by Dilnur Yuldashev on 4/18/16.
//  Copyright © 2016 Dilnur Yuldashev. All rights reserved.
//

#import "CardMatchingGame.h"
@interface CardMatchingGame()
@property (nonatomic, readwrite) NSInteger score;
@property (strong, nonatomic) NSMutableArray *cards;
@end

@implementation CardMatchingGame

-(NSMutableArray *) cards{
    if(!_cards) _cards = [[NSMutableArray alloc] init];
    return _cards;
}
-(instancetype)initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck{
    self = [super init];
    if(self){
        for(int i = 0; i<count;i++){
            Card * card = [deck drawRandomCard];
            if(card){
                [self.cards addObject:card];
            }else{
                self = nil;
                break;
            }
        }
    }
    return self;
}
-(instancetype) init{
    return nil;
}
static const int PENALTY = 2;
static const int BONUS = 4;
static const int CHOICE_COST = 1;

-(void) chooseCardAtIndex:(NSUInteger)index{
    Card * card = [self cardAtIndex:index];
    if(!card.isMatched){
        if(card.isChosen){
            card.chosen = NO;
        }
        else{
            for(Card *otherCard in self.cards){
                NSLog(@"Card Matching Game chosen: %d and matched: %d", otherCard.isChosen, otherCard.isMatched);

                if(otherCard.isChosen && !otherCard.isMatched){
                    int matchScore = [card match:@[otherCard]];
                    NSLog(@"Match score: %d", matchScore);
                    if(matchScore){
                        self.score +=matchScore*BONUS;
                        card.matched = YES;
                        otherCard.matched = YES;
                    }else{
                        otherCard.chosen = NO;
                        self.score-=PENALTY;
                    }
                    break;

                }
            }
            self.score -= CHOICE_COST;
            card.chosen = YES;
        }
    }

}
-(Card *) cardAtIndex:(NSUInteger)index{
    return self.cards[index];
}
@end
