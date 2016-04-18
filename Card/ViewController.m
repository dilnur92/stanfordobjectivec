//
//  ViewController.m
//  Card
//
//  Created by Dilnur Yuldashev on 4/15/16.
//  Copyright © 2016 Dilnur Yuldashev. All rights reserved.
//

#import "ViewController.h"
#import "Deck.h"
#import "PlayingCardDeck.h"
#import "Card.h"
#import "CardMatchingGame.h"
@interface ViewController ()
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (strong, nonatomic) Deck * deck;
@property (strong, nonatomic) CardMatchingGame * game;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@end



@implementation ViewController
- (IBAction)touchCardButton:(id)sender {
    int cardIndex = [self.cardButtons indexOfObject:sender];
    [self.game chooseCardAtIndex:cardIndex];
    [self updateUI];
    
}

-(void) updateUI{
    for(UIButton *cardButton in self.cardButtons){
        int cardIndex = [self.cardButtons indexOfObject:cardButton];
        Card * card=[self.game cardAtIndex:cardIndex];
        [cardButton setTitle:[self titleForCard:card] forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self backgroundImageForCard:card] forState:UIControlStateNormal];
        cardButton.enabled = !card.isMatched;
    }
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d", self.game.score];
}

-(NSString *) titleForCard: (Card *) card{
    //NSLog(@"titleForCard is chosen %d", card.isChosen);
    return card.isChosen ? card.contents : @"";
}

-(UIImage *) backgroundImageForCard: (Card *) card{
    //NSLog(@"backgroundImageForCard is chosen %d", card.isChosen);

    return [UIImage imageNamed:card.isChosen ? @"card_front": @"card_back"];
}
-(CardMatchingGame *) game{
    if(!_game){
        _game = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count] usingDeck:[self createDeck]];
    }
    return _game;
}
-(Deck *) createDeck{
    return [[PlayingCardDeck alloc] init];
}

-(Deck *) deck{
    if(!_deck){
        _deck = [self createDeck];
    }
    return _deck;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
