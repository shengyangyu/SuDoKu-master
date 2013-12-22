//
//  SDViewController.m
//  SuDoKu
//
//  Created by ysy on 13-12-2.
//  Copyright (c) 2013年 com.ysy.www. All rights reserved.
//

#import "SDViewController.h"
#import "SDChoiceGameVC.h"
#import "SDShowGameVC.h"
#import "UIButton+Bootstrap.h"
#import "SDCommonMethod.h"


@interface SDViewController ()<SDChoiceGameVCDelegate>

@property (nonatomic,retain)SDChoiceGameVC *choiceVC;

@end

@implementation SDViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self buttonCustomerMethod];
    
}
- (void)setChoiceVCLabelString:(NSString *)tltle
{
    if (!_choiceVC)
    {
        self.choiceVC = [[[SDChoiceGameVC alloc] initWithNibName:@"SDChoiceGameVC" bundle:nil] autorelease];
        self.choiceVC.titleLabel.text = tltle;
        self.choiceVC.choiceDelegate = self;
        [self addChildViewController:self.choiceVC];
    }
    self.choiceVC.titleLabel.text = tltle;
}
#pragma mark -按钮外形
- (void)buttonCustomerMethod
{
    [self.button6 buttonOrangeStyle];
    [self.button9 buttonBlueStyle];
    [self.buttonMore buttonGreenStyle];
    [self.buttonLast buttonPurpleStyle];
}

#pragma mark -按钮 事件
- (IBAction)classicMethod:(UIButton *)sender
{
    self.choiceVC.currentModel = GAME_MODE_6;
    [self setChoiceVCLabelString:@"6 阶"];
    [SDCommonMethod panIn:self.choiceVC.view withpParentView:self.view];
    /*
    SDShowGameVC *gameVC = [[[SDShowGameVC alloc] initWithNibName:@"SDShowGameVC" bundle:nil withGameModel:GAME_MODE_6]autorelease];
    [self presentViewController:gameVC animated:YES completion:^{
        
    }];
     */
}

- (IBAction)challengeMethod:(UIButton *)sender
{
    self.choiceVC.currentModel = GAME_MODE_9;
    [self setChoiceVCLabelString:@"9 阶"];
    [SDCommonMethod panIn:self.choiceVC.view withpParentView:self.view];
    /*
    SDShowGameVC *gameVC = [[[SDShowGameVC alloc] initWithNibName:@"SDShowGameVC" bundle:nil withGameModel:GAME_MODE_9]autorelease];
    [self presentViewController:gameVC animated:YES completion:^{
        
    }];
     */
}

- (IBAction)fightMethod:(UIButton *)sender
{

}

#pragma mark -SDChoiceGameVCDelegate
- (void)dismissViewMethod
{
    [SDCommonMethod panOut:self.choiceVC.view withpParentView:self.view];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_button9 release];
    [_button6 release];
    [_buttonMore release];
    [_buttonLast release];
    [_mainView release];
    [super dealloc];
}
@end
