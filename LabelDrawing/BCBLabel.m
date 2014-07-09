 //
//  BCBLabel.m
//  LabelDrawing
//
//  Created by Steven Vandeweghe on 08/07/14.
//  Copyright (c) 2014 Blue Crowbar. All rights reserved.
//

#import "BCBLabel.h"

@interface BCBLabel ()

@property (nonatomic, strong) NSTextStorage *textStorage;
@property (nonatomic, strong) NSLayoutManager *layoutManager;
@property (nonatomic, strong) NSTextContainer *textContainer;

@end


@implementation BCBLabel

- (void)drawRect:(CGRect)rect
{
	NSRange range = NSMakeRange(0, self.attributedText.length);
	
	if (self.color) {
		[self.layoutManager enumerateLineFragmentsForGlyphRange:range usingBlock:^(CGRect rect, CGRect usedRect, NSTextContainer *textContainer, NSRange glyphRange, BOOL *stop) {
			CGRect r = CGRectInset(usedRect, 0, self.lineSpacing * 0.5);
			UIBezierPath *path = [UIBezierPath bezierPathWithRect:r];
			[self.color set];
			[path fill];
		}];
	}
	
	if (self.makeTextVisibleForDebugging) {
		[self.layoutManager drawGlyphsForGlyphRange:range atPoint:CGPointZero];
	}
}


- (void)layoutSubviews
{
	self.textContainer.size = CGSizeMake(self.frame.size.width, FLT_MAX);
	[self invalidateIntrinsicContentSize];
}


- (void)setAttributedText:(NSAttributedString *)attributedText
{
	_attributedText = attributedText;
	
	NSTextStorage *textStorage = [[NSTextStorage alloc] initWithAttributedString:attributedText];
	NSLayoutManager *layoutManager = [NSLayoutManager new];
	NSTextContainer *textContainer = [NSTextContainer new];
	textContainer.lineFragmentPadding = 0.0;
	[layoutManager addTextContainer:textContainer];
	[textStorage addLayoutManager:layoutManager];
	
	self.textStorage = textStorage;
	self.layoutManager = layoutManager;
	self.textContainer = textContainer;
	
	[self invalidateIntrinsicContentSize];
	
	[self setNeedsLayout];
	[self setNeedsDisplay];
}


- (CGSize)intrinsicContentSize
{
	NSRange range = NSMakeRange(0, self.attributedText.length);
	CGRect rect = [self.layoutManager boundingRectForGlyphRange:range inTextContainer:self.textContainer];
	rect = CGRectIntegral(rect);
	rect.size.width = UIViewNoIntrinsicMetric;
	return rect.size;
}

@end
