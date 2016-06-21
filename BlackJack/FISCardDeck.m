//
//  FISCardDeck.m
//  OOP-Cards-Model
//
//  Created by Bettina on 6/17/16.
//  Copyright © 2016 Al Tyus. All rights reserved.
//

#import "FISCardDeck.h"

@implementation FISCardDeck



-(instancetype)init{
    
    self = [super init];
    
    if(self) {
    
        _remainingCards = [[NSMutableArray alloc] init];
        _dealtCards = [[NSMutableArray alloc]init];
        
        [self generateCardDeck];
    }
    return self;
}

-(void)generateCardDeck{
    NSArray *validSuits = [FISCard validSuits];
    NSArray *validRanks =[FISCard validRanks];
    
    for (NSString *suit in validSuits){
        for (NSString *rank in validRanks){
            FISCard *card = [[FISCard alloc]initWithSuit:suit rank:rank];
            [self.remainingCards addObject:card];
        }
    }
    
}


-(FISCard *)drawNextCard{
    
    if (self.remainingCards.count == 0){
        NSLog(@"The deck is empty.");
        return nil;
    }
    
        FISCard *cardDrawn = self.remainingCards[0];
        [self.dealtCards addObject:cardDrawn];
        [self.remainingCards removeObjectAtIndex:0];
    
    return cardDrawn;
    
}

-(void)resetDeck{
    [self gatherDealtCards];
    [self shuffleRemainingCards];
}

-(void)gatherDealtCards{

    [self.remainingCards addObjectsFromArray:self.dealtCards];
    [self.dealtCards removeAllObjects];
        
}


-(void)shuffleRemainingCards{
    NSMutableArray *pickUpDeck =[self.remainingCards mutableCopy];
    [self.remainingCards removeAllObjects];
    
    NSUInteger total = [pickUpDeck count];
    for (NSUInteger i = 0; i<total; i++){
        
        NSUInteger cardCount = [pickUpDeck count];
        NSUInteger randomIndex = arc4random_uniform((uint32_t)cardCount);
        
        
        FISCard *randomCardDrawn = pickUpDeck[randomIndex];
        [pickUpDeck removeObjectAtIndex:randomIndex];
        [self.remainingCards addObject:randomCardDrawn];
        
    }
    
}


-(NSString *)description{
    
    NSMutableString *cardsLeft = [[NSMutableString alloc]init];
    
    for (FISCard *card in self.remainingCards){
        
        [cardsLeft appendFormat:@" %@",card.description];
    
    }
   
    NSString *deckDescription = [NSString stringWithFormat:@"count: %lu \ncards: %@",self.remainingCards.count, cardsLeft];
   
    return deckDescription;
    

}

@end
