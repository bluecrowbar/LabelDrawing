//
//  BCBViewController.m
//  LabelDrawing
//
//  Created by Steven Vandeweghe on 08/07/14.
//  Copyright (c) 2014 Blue Crowbar. All rights reserved.
//

#import "BCBViewController.h"
#import "BCBLabel.h"

@interface BCBViewController () <NSLayoutManagerDelegate>

@property (nonatomic, weak) IBOutlet BCBLabel *label;

@end


@implementation BCBViewController

- (void)viewDidLoad
{
	[super viewDidLoad];
	
	self.label.attributedText = [[NSAttributedString alloc] initWithString:@"This is a test. This is a test. This is a test. This is a test. This is a test. This is a test." attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:17.0]}];
	self.label.lineSpacing = 2;
	self.label.makeTextVisibleForDebugging = YES;
	self.label.color = [UIColor orangeColor];
}

@end
