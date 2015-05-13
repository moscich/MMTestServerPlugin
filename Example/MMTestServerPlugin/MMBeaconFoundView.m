//
// Created by Marek Mościchowski on 13/05/15.
// Copyright (c) 2015 Marek Mościchowski. All rights reserved.
//

#import "MMBeaconFoundView.h"


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
  self.minorLabel = [UILabel new];
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

@end