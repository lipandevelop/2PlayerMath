//
//  ViewController.m
//  2PlayerMath
//
//  Created by Li Pan on 2016-01-18.
//  Copyright © 2016 Li Pan. All rights reserved.
//

#import "ViewController.h"
#import "Player.h"

@interface ViewController ()

@property (strong, nonatomic) IBOutlet UILabel *playerStatusLabel;
@property (strong, nonatomic) IBOutlet UILabel *displayLabel;
@property (strong, nonatomic) NSMutableString *displayString;
@property (assign, nonatomic) int number;
@property (strong, nonatomic) NSString *operator;
@property (assign, nonatomic) int unitPlace;
@property (assign, nonatomic) int x;
@property (assign, nonatomic) int y;
@property (strong, nonatomic) NSMutableString *playerAnswerString;
@property (assign, nonatomic) NSArray *players;
@property (assign, nonatomic) int currentPlayer;
@property (assign, nonatomic) BOOL currentPlayerIsPlayer1;

@end

@implementation ViewController

- (int)randomNumber {
    return arc4random_uniform(19);
}

- (BOOL)switchPlayer {
    if (self.currentPlayerIsPlayer1) {
        return YES;
    }
    return NO;
    
}

- (NSString *)randomOperator {
    int r = arc4random_uniform(3);
    NSString *operation;
    if (r == 0) {
        operation = @"+";
    }
    if (r == 1) {
        operation = @"-";
    }
    if (r == 2) {
        operation = @"*";
    }
    if (r == 3) {
        operation = @"/";
    }
    return operation;
}

-(int)doMathXVariable:(int)xVar operation:(NSString *)operationString yVariable:(int)yVar {
    
    if ([operationString isEqualToString:@"+"]) {
        return xVar + yVar;
    }
    if ([operationString isEqualToString:@"-"]) {
        return xVar - yVar;
    }
    if ([operationString isEqualToString:@"*"]) {
        return xVar * yVar;
    }
    if ([operationString isEqualToString:@"/"]) {
        return xVar / yVar;
    }
    return 0;
}

- (BOOL)answerCheckWithComptuer: (int)computerAnswer checkWithPlayerAnswer: (int)playerAnswer {
    if (computerAnswer == playerAnswer) {
        return YES;
    }
    return NO;
}

- (void)createNewQuestion {
    Player *currentPlayer;
    self.playerAnswerString = [@"?" mutableCopy];
    self.operator = [self randomOperator];
    self.x = [self randomNumber];
    self.y = [self randomNumber];
    self.displayString = [NSMutableString stringWithFormat:@"%@: %d %@ %d = %@", currentPlayer.playerName, self.x, self.operator, self.y, self.playerAnswerString];


}

- (void)upDateAnswerLabel {
    Player *currentPlayer = self.players[self.currentPlayer];
    self.displayString = [NSMutableString stringWithFormat:@"%@: %d %@ %d = %@", currentPlayer.playerName, self.x, self.operator, self.y, self.playerAnswerString];
    self.displayLabel.text = self.displayString;
    
}

- (BOOL)player1Check {
    return YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.currentPlayer = 0;
    
    [self createNewQuestion];
    
    self.playerAnswerString = [NSMutableString string];
    
    Player *player1 = [[Player alloc] init];
    player1.playerName = @"Dude1";
    
    Player *player2 = [[Player alloc] init];
    player2.playerName = @"Dude2";
    
    self.players = @[player1, player2];


}

- (IBAction)button1:(UIButton *)sender {
    self.playerAnswerString = [[self.playerAnswerString stringByAppendingString:@"1"] mutableCopy];
    NSLog(@"%@", self.playerAnswerString);
    [self upDateAnswerLabel];
}
- (IBAction)button2:(UIButton *)sender {
    self.playerAnswerString = [[self.playerAnswerString stringByAppendingString:@"2"] mutableCopy];
    NSLog(@"%@", self.playerAnswerString);
    [self upDateAnswerLabel];
}
- (IBAction)button3:(UIButton *)sender {
    self.playerAnswerString = [[self.playerAnswerString stringByAppendingString:@"3"] mutableCopy];
    NSLog(@"%@", self.playerAnswerString);
    [self upDateAnswerLabel];
}
- (IBAction)button4:(UIButton *)sender {
    self.playerAnswerString = [[self.playerAnswerString stringByAppendingString:@"4"] mutableCopy];
    NSLog(@"%@", self.playerAnswerString);
    [self upDateAnswerLabel];
}
- (IBAction)button5:(UIButton *)sender {
    self.playerAnswerString = [[self.playerAnswerString stringByAppendingString:@"5"] mutableCopy];
    NSLog(@"%@", self.playerAnswerString);
    [self upDateAnswerLabel];
}
- (IBAction)button6:(UIButton *)sender {
    self.playerAnswerString = [[self.playerAnswerString stringByAppendingString:@"6"] mutableCopy];
    NSLog(@"%@", self.playerAnswerString);
    [self upDateAnswerLabel];
}
- (IBAction)button7:(UIButton *)sender {
    self.playerAnswerString = [[self.playerAnswerString stringByAppendingString:@"7"] mutableCopy];
    NSLog(@"%@", self.playerAnswerString);
    [self upDateAnswerLabel];
}
- (IBAction)button8:(UIButton *)sender {
    self.playerAnswerString = [[self.playerAnswerString stringByAppendingString:@"8"] mutableCopy];
    NSLog(@"%@", self.playerAnswerString);
    [self upDateAnswerLabel];
}
- (IBAction)button9:(UIButton *)sender {
    self.playerAnswerString = [[self.playerAnswerString stringByAppendingString:@"9"] mutableCopy];
    NSLog(@"%@", self.playerAnswerString);
    [self upDateAnswerLabel];
}
- (IBAction)button0:(UIButton *)sender {
    self.playerAnswerString = [[self.playerAnswerString stringByAppendingString:@"0"] mutableCopy];
    NSLog(@"%@", self.playerAnswerString);
    [self upDateAnswerLabel];
}
- (IBAction)buttonEnter:(UIButton *)sender {
    int computerAnswer = [self doMathXVariable:self.x operation:self.operator yVariable:self.y];
    int playerAnswer = [self.playerAnswerString intValue];
    
    BOOL result = [self answerCheckWithComptuer:computerAnswer checkWithPlayerAnswer:playerAnswer];
    if (!result) {
        Player *currentPlayer = self.players[self.currentPlayer];
        currentPlayer.playerLifeLeft --;
        
    }
    self.currentPlayer = (self.currentPlayer + 1) % self.players.count;
    [self createNewQuestion];
    
}
@end
