//
//  ViewController.m
//  2PlayerMath
//
//  Created by Li Pan on 2016-01-18.
//  Copyright © 2016 Li Pan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) IBOutlet UILabel *displayLabel;
@property (strong, nonatomic) NSMutableString *displayString;
@property (assign, nonatomic) int number;
@property (strong, nonatomic) NSString *player;
@property (strong, nonatomic) NSString *operator;
@property (assign, nonatomic) int x;
@property (assign, nonatomic) int y;


@end

@implementation ViewController

- (int)randomNumber {
    return arc4random_uniform(19);
}

- (NSString *)playerSelector {
    int r = arc4random_uniform(2);
    if (r == 0) {
        return @"Player 1";
    }
    return @"player 2";
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

- (BOOL)player1Check {
    return YES;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.player = [self playerSelector];
    self.operator = [self randomOperator];
    self.x = [self randomNumber];
    self.y = [self randomNumber];
    
    int answer = [self doMathXVariable:self.x operation:self.operator yVariable:self.y];
    
    NSString *answerPlaceHolder = @"?";
    self.displayString = [NSMutableString stringWithFormat:@"%@: %d %@ %d = %@", self.player, self.x, self.operator, self.y, answerPlaceHolder];

}

- (IBAction)button1:(UIButton *)sender {
    self.number = 1;
}
- (IBAction)button2:(UIButton *)sender {
    self.number = 2;
}
- (IBAction)button3:(UIButton *)sender {
    self.number = 3;
}
- (IBAction)button4:(UIButton *)sender {
    self.number = 4;
}
- (IBAction)button5:(UIButton *)sender {
    self.number = 5;
}
- (IBAction)button6:(UIButton *)sender {
    self.number = 6;
}
- (IBAction)button7:(UIButton *)sender {
    self.number = 7;
}
- (IBAction)button8:(UIButton *)sender {
    self.number = 8;
}
- (IBAction)button9:(UIButton *)sender {
    self.number = 9;
}
- (IBAction)button0:(UIButton *)sender {
    self.number = 0;
}
- (IBAction)buttonEnter:(UIButton *)sender {
}
@end
