//
// Created by Marek Mościchowski on 21.09.15.
// Copyright (c) 2015 Marek Mościchowski. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <GameController/GameController.h>

@protocol MMTestEventAggregate;

@interface MMGameController : NSObject
+ (MMGameController *)instance;

@property(nonatomic, strong) GCController *controller;
@property(nonatomic, strong) UILabel *label;
@property(nonatomic, strong) id <MMTestEventAggregate> eventAggregate;

- (void)startOnWindow:(UIWindow *)window;
@end