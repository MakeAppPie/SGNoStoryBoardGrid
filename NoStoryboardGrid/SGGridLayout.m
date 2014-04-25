//
//  SGGridLayout.m
//  NoStoryboardGrid
//
//  Created by Steven Lipton on 4/23/14.
//  Copyright (c) 2014 Steven Lipton. All rights reserved.
//

#import "SGGridLayout.h"

@implementation SGGridLayout{
    CGRect subviewFrame;
    CGRect contentFrame;

}

//makes a frame given a size and padding.
-(CGRect)makeContentRectFromSize:(CGSize)size {
    CGRect frame;
    frame.size.width = size.width  -  (2 * self.padding);
    frame.size.height = size.height - (2 * self.padding);
    frame.origin.x = self.padding;
    frame.origin.y = self.padding;
    return frame;
}

-(CGSize)cellSize{
    CGRect frame = [self makeContentRectFromSize: self.viewFrame.size];
    CGSize cellFrameSize;
    cellFrameSize.width = frame.size.width/self.totalColumns;
    cellFrameSize.height = frame.size.height/self.totalRows;
    return cellFrameSize;
}

-(CGRect)gridLayoutRect{
    contentFrame = [self makeContentRectFromSize:self.viewFrame.size];
    CGSize cellFrameSize = [self cellSize];
    subviewFrame.origin.x = (cellFrameSize.width * self.column) + self.padding + contentFrame.origin.x;
    subviewFrame.origin.y = (cellFrameSize.height * self.row) + self.padding + contentFrame.origin.y;
    subviewFrame.size.height = cellFrameSize.height * self.rowspan - self.padding;
    subviewFrame.size.width = cellFrameSize.width * self.columnspan - self.padding;
    return subviewFrame;
}
-(CGRect)gridLayoutRectRow:(int)row column:(int)column rowSpan:(int)rowspan columnspan:(int)columnspan{
    self.row = row;
    self.column = column;
    self.columnspan = columnspan;
    self.rowspan = rowspan;
    return [self gridLayoutRect];
}

-(CGRect)gridLayoutRect:(CGPoint)origin size:(CGSize)size{
    self.row = origin.y;
    self.column = origin.x;
    self.columnspan = size.width;
    self.rowspan = size.height;
    return [self gridLayoutRect];
}

-(CGRect)gridLayoutRect:(CGRect)grid{
    self.row = grid.origin.y;
    self.column = grid.origin.x;
    self.columnspan = grid.size.width;
    self.rowspan = grid.size.height;
    return [self gridLayoutRect];
}

-(void) initWithFrame:(CGRect)frame rows:(int)totalRows columns:(int)totalColumns{
    _viewFrame = frame;
    _totalRows = totalRows;
    _totalColumns = totalColumns;
    //set some default values
    _rowspan =1;
    _columnspan =1;
    _padding = 10;
    _row = 0;
    _column = 0;
    
}

-(void) initWithFrame:(CGRect)frame{
    _viewFrame = frame;
    _totalRows = 6;
    _totalColumns  = 9;
    //set some default values
    _padding = 10;
    _row = 0;
    _column = 0;

}

@end
