//
// Created by Marek Mościchowski on 05/05/15.
// Copyright (c) 2015 Miquido. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SocketRocket/SRWebSocket.h>
#import <objc/runtime.h>
#import <UIKit/UIKit.h>
#import <GameController/GameController.h>

@class MMTestAutoResolver;
@class MMResolveTestServerViewController;
@class MMTestEventAggregate;


@protocol MMTestEventAggregate;

@interface MMFakeWebSocket : NSObject <SRWebSocketDelegate, NSNetServiceBrowserDelegate, NSStreamDelegate, NSStreamDelegate, NSNetServiceDelegate>


@property(nonatomic, strong) NSNetService *netService;
@property(nonatomic, strong) SRWebSocket *webSocket;
@property(nonatomic, strong) MMTestAutoResolver *testAutoResolver;
@property(nonatomic, strong) MMResolveTestServerViewController *controller;
@property(nonatomic) Method customAppDelegate;
@property(nonatomic, strong) id <MMTestEventAggregate> eventAggregate;
@property(nonatomic, copy) NSString *serverAddress;
@property(nonatomic, assign) BOOL workaroundTwiceUIApplicationSwizzle;

@property(nonatomic, strong) UILabel *label;

+ (instancetype)fakeManager;

- (void)start;

- (void)launchWebSocketsForService:(NSNetService *)service;

@end