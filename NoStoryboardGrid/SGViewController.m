//
//  SGViewController.m
//  NoStoryboardGrid
//
//  Created by Steven Lipton on 4/23/14.
//  Copyright (c) 2014 Steven Lipton. All rights reserved.
//

#import "SGViewController.h"
#import "SGGridLayout.h"

@interface SGViewController ()

@end

@implementation SGViewController{
    SGGridLayout *myGridLayout;
    UIButton *onOffButton;
    BOOL isPowerOn;
    UITextField *timeText;
}

//A method to make a grid
-(CGRect) gridFromFrame:(CGRect)frame column:(int)column row:(int)row columnSpan:(int)columnSpan rowSpan:(int)rowSpan {
    CGRect newFrame;
    
    return newFrame;
}

-(void)onOffButtonPressed{
    if (isPowerOn){
        isPowerOn=NO;
        [onOffButton setTitle:@"OFF" forState:UIControlStateNormal];
    }else{
        isPowerOn=YES;
        [onOffButton setTitle:@"ON" forState:UIControlStateNormal];
    }
}

-(void)sequenceButtonPressed:(UIButton *)sender{
    timeText.text = sender.titleLabel.text;
}

-(void)makeViewsOnController{
     self.view.contentMode = UIViewContentModeRedraw;
    //[myGridLayout initWithFrame:self.view.frame rows:6 columns:5];

    //an example of coding our own buttons, labels and text fields
    //make the  static time label
    UILabel *timeLabel = [[UILabel alloc]initWithFrame:[myGridLayout gridLayoutRectRow:1 column:0 rowSpan:1 columnspan:2]];
    timeLabel.text = @"Time";
    [self.view addSubview:timeLabel];
    //make the  Static voltage label
    UILabel *voltageLabel = [[UILabel alloc]initWithFrame:[myGridLayout gridLayoutRectRow:2 column:0 rowSpan:1 columnspan:2]];
    voltageLabel.text = @"Voltage";
    [self.view addSubview:voltageLabel];
    
    //make the  TIME text field
    timeText = [[UITextField alloc]initWithFrame:[myGridLayout gridLayoutRectRow:1 column:2 rowSpan:1 columnspan:2]];
    timeText.placeholder = @" 00";
    timeText.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:timeText];
    
    //make the  voltage  text field
    UITextField *voltageText = [[UITextField alloc]initWithFrame:[myGridLayout gridLayoutRectRow:2 column:2 rowSpan:1 columnspan:2]];
    voltageText.placeholder = @" 150";
    voltageText.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:voltageText];
    
    //make the on/off button
    onOffButton=[UIButton buttonWithType:UIButtonTypeSystem];
    myGridLayout.row = 4;
    myGridLayout.column = 0;
    myGridLayout.columnspan = 5;
    myGridLayout.rowspan = 1;
    onOffButton.frame = [myGridLayout gridLayoutRect];
    onOffButton.backgroundColor = [UIColor grayColor];
    [onOffButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [onOffButton setTitle:@"OFF" forState:UIControlStateNormal];
    [onOffButton addTarget:self action:@selector(onOffButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:onOffButton];
    
    
    //make a series of buttons with a for loop
    for(int i=0;i<5;i++){
        //make the button
        UIButton *seriesButton=[UIButton buttonWithType:UIButtonTypeSystem];
        
        //set the grid location
        myGridLayout.row = 3;
        myGridLayout.column = i;
        myGridLayout.columnspan = 1;
        myGridLayout.rowspan = 1;
        seriesButton.frame = [myGridLayout gridLayoutRect];
        
        //properties for the button
        seriesButton.backgroundColor = [UIColor blueColor ];
        [seriesButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [seriesButton setTitle:[NSString stringWithFormat:@"%i",i] forState:UIControlStateNormal];
        //set the target action.
        [seriesButton addTarget:self action:@selector(sequenceButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
        //add to the view
        [self.view addSubview:seriesButton];
    }
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [self makeViewsOnController];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    if (myGridLayout == nil){
        myGridLayout = [[SGGridLayout alloc]init];
    }
    [myGridLayout initWithFrame:self.view.frame rows:6 columns:5];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
