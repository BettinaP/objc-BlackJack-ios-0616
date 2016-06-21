//  FISAppDelegate.m

#import "FISAppDelegate.h"

#import "FISBlackjackPlayer.h"
#import "FISBlackjackGame.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
//    FISBlackjackPlayer *Bettina = [[FISBlackjackPlayer alloc]initWithName:@"Bettina"];
//    NSLog(@"\n\n\n\n%@", self.description);
//    
//    FISCardDeck *cardDeck =[[FISCardDeck alloc]init];
//    
//    FISCard *nextCard = [cardDeck drawNextCard];
//
//    [Bettina acceptCard:nextCard];
//    NSLog(@"\n\n\n\n%@",Bettina);
    
    FISBlackjackGame *game = [[FISBlackjackGame alloc] init];
    [game playBlackjack];
    [game playBlackjack];
    [game playBlackjack];
    
    return YES;
}

@end
