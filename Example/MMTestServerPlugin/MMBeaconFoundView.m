//
// Created by Marek Mościchowski on 13/05/15.
// Copyright (c) 2015 Marek Mościchowski. All rights reserved.
//

#import "MMBeaconFoundView.h"

@interface MMBeaconFoundView ()

@property(nonatomic, strong) UILabel *majorLabel;
@property(nonatomic, strong) UILabel *minorLabel;

@end

@implementation MMBeaconFoundView {

}

- (instancetype)init {
  self = [super init];
  if (self) {
    self.backgroundColor = [UIColor whiteColor];
    [self setupCloseButton];
    [self setupMajorMinorLabel];
  }

  return self;
}

- (void)setupCloseButton {
  UIButton *closeButton = [UIButton new];
  closeButton.accessibilityLabel = @"Close";
  [closeButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
  [self addSubview:closeButton];
  [closeButton setTitle:@"Close" forState:UIControlStateNormal];
  closeButton.translatesAutoresizingMaskIntoConstraints = NO;
  [closeButton addTarget:self action:@selector(closeButtonTapped) forControlEvents:UIControlEventTouchUpInside];
  [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[closeButton]-|" options:NSLayoutFormatAlignmentMask metrics:nil views:NSDictionaryOfVariableBindings(closeButton)]];
  [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[closeButton]" options:NSLayoutFormatAlignmentMask metrics:nil views:NSDictionaryOfVariableBindings(closeButton)]];
}

- (void)setupMajorMinorLabel {

  self.majorLabel = [UILabel new];
  self.accessibilityLabel = @"Beacon Found";
  self.majorLabel.accessibilityLabel = @"Major";
  self.minorLabel = [UILabel new];
  self.minorLabel.accessibilityLabel = @"Minor";

  self.majorLabel.translatesAutoresizingMaskIntoConstraints = NO;
  self.minorLabel.translatesAutoresizingMaskIntoConstraints = NO;
  [self addSubview:self.majorLabel];
  [self addSubview:self.minorLabel];
  [self addConstraint:[NSLayoutConstraint constraintWithItem:self.minorLabel attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0]];
  [self addConstraint:[NSLayoutConstraint constraintWithItem:self.majorLabel attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0]];
  [self addConstraint:[NSLayoutConstraint constraintWithItem:self.majorLabel attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0]];
  [self addConstraint:[NSLayoutConstraint constraintWithItem:self.majorLabel attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.minorLabel attribute:NSLayoutAttributeTop multiplier:1.0 constant:0]];
}

- (void)closeButtonTapped {
  [self.delegate dismissBeaconView];
}

- (void)setMinor:(int)minor {
  self.minorLabel.text = [NSString stringWithFormat:@"Minor: %d", minor];
  self.minorLabel.accessibilityValue = [NSString stringWithFormat:@"Minor: %d", minor];
}

- (void)setMajor:(int)major {
  self.majorLabel.text = [NSString stringWithFormat:@"Major: %d", major];
  self.majorLabel.accessibilityValue = [NSString stringWithFormat:@"Major: %d", major];
}


@end