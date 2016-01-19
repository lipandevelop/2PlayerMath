//
//  ViewController.m
//  2PlayerMath
//
//  Created by Li Pan on 2016-01-18.
//  Copyright © 2016 Li Pan. All rights reserved.
//

#import "ViewController.h"
#import "Player.h"

#pragma Properties

@interface ViewController ()

@property (strong, nonatomic) IBOutlet UIImageView *player1HealthBar;
@property (strong, nonatomic) IBOutlet UIImageView *player2HealthBar;
@property (strong, nonatomic) IBOutlet UILabel *player1StatusLabel;
@property (strong, nonatomic) IBOutlet UILabel *player2StatusLabel;
@property (strong, nonatomic) IBOutlet UILabel *displayLabel;
@property (strong, nonatomic) NSMutableString *displayString;
@property (assign, nonatomic) int number;
@property (strong, nonatomic) NSString *operator;
@property (assign, nonatomic) int unitPlace;
@property (assign, nonatomic) int x;
@property (assign, nonatomic) int y;
@property (strong, nonatomic) NSMutableString *playerAnswerString;
@property (strong, nonatomic) NSArray *players;
@property (assign, nonatomic) int currentPlayer;
@property (assign, nonatomic) BOOL currentPlayerIsPlayer1;

@end

#pragma Functions

@implementation ViewController

- (int)randomNumber {
    return arc4random_uniform(19);
}

- (void)playerHealthBarAlpha: (UIImageView *)healthBarAlpha lifeInt: (int)lifeLeft {
    if (lifeLeft == 3) {
        healthBarAlpha.alpha = 0.80;
    }
    if (lifeLeft == 2) {
        healthBarAlpha.alpha = 0.50;
    }
    if (lifeLeft == 1) {
        healthBarAlpha.alpha = 0.25;
    }
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
        operation = @"X";
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
    self.playerAnswerString = [@"" mutableCopy];
    self.operator = [self randomOperator];
    self.x = [self randomNumber];
    self.y = [self randomNumber];
    [self upDateAnswerLabel];
}

- (void)upDateAnswerLabel {
    NSLog(@"%lu",(unsigned long)self.players.count);
    Player *cPlayer = self.players[self.currentPlayer];
    self.displayString = [NSMutableString stringWithFormat:@"%@:\n %d %@ %d = %@", cPlayer.playerName, self.x, self.operator, self.y, self.playerAnswerString];
    self.displayLabel.text = self.displayString;
    
}

- (BOOL)player1Check {
    return YES;
}

- (void) upDateStatusLabel {

    Player *player1 = self.players[0];
    Player *player2 = self.players[1];
    
    NSMutableString *player1StatusString = [NSMutableString stringWithFormat:@"%@: %d", player1.playerName, player1.playerLifeLeft];
    [self playerHealthBarAlpha:self.player1HealthBar lifeInt:player1.playerLifeLeft];
    
    NSMutableString *player2StatusString = [NSMutableString stringWithFormat:@"%@: %d", player2.playerName, player2.playerLifeLeft];
    [self playerHealthBarAlpha:self.player2HealthBar lifeInt:player2.playerLifeLeft];
    
    [self upDateAnswerLabel];
    
    self.player1StatusLabel.text = player1StatusString;
    
    self.player2StatusLabel.text = player2StatusString;
}

#pragma viewDidLoad

- (void)viewDidLoad {
    [super viewDidLoad];
    
    Player *player1 = [[Player alloc] init];
    player1.playerName = @"Dude1";
    
    Player *player2 = [[Player alloc] init];
    player2.playerName = @"Dude2";

    [self createNewQuestion];
    
    self.players = @[player1, player2];
    [self upDateStatusLabel];



}
- (IBAction)backButton:(UIButton *)sender {
    self.playerAnswerString = [[self.playerAnswerString stringByDeletingLastPathComponent] mutableCopy];
    NSLog(@"%@", self.playerAnswerString);
    [self upDateAnswerLabel];
}

- (IBAction)buttonNegative:(UIButton *)sender {
    self.playerAnswerString = [[@"-" stringByAppendingString:self.playerAnswerString] mutableCopy];
    NSLog(@"%@", self.playerAnswerString);
    [self upDateAnswerLabel];
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
        [self upDateStatusLabel];
        
    }
    self.currentPlayer = (self.currentPlayer + 1) % self.players.count;
    [self createNewQuestion];
    
}
@end
