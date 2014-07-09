//
//  BCBLabel.h
//  LabelDrawing
//
//  Created by Steven Vandeweghe on 08/07/14.
//  Copyright (c) 2014 Blue Crowbar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BCBLabel : UIView

@property (nonatomic, strong) NSAttributedString *attributedText;
@property (nonatomic, assign) CGFloat lineSpacing;
@property (nonatomic, assign) BOOL makeTextVisibleForDebugging;
@property (nonatomic, strong) UIColor *color;

@end
