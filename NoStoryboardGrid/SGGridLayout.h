//
//  SGGridLayout.h
//  NoStoryboardGrid
//
//  Created by Steven Lipton on 4/23/14.
//  Copyright (c) 2014 Steven Lipton. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SGGridLayout : NSObject

@property CGRect viewFrame;
@property int totalRows;
@property int totalColumns;
@property int row;
@property int column;
@property int rowspan;
@property int columnspan;
@property CGFloat padding;

-(CGRect)gridLayoutRect;
-(void) initWithFrame:(CGRect)frame rows:(int)totalRows columns:(int)totalCoulmns;
-(CGRect)gridLayoutRectRow:(int)row column:(int)column rowSpan:(int)rowspan columnspan:(int)columnspan;
@end
