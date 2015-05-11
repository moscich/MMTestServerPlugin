//
// Created by Marek Mościchowski on 05/05/15.
// Copyright (c) 2015 Miquido. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SocketRocket/SRWebSocket.h>
#import <objc/runtime.h>
#import <UIKit/UIKit.h>

@class MMTestAutoResolver;
@class MMResolveTestServerViewController;

@protocol MMFakeWebSocketDelegate

- (void)locateFakeBeacon;

@end

@interface MMFakeWebSocket : NSObject <SRWebSocketDelegate, NSNetServiceBrowserDelegate, NSStreamDelegate, NSStreamDelegate, NSNetServiceDelegate>

@property (nonatomic, weak) id <MMFakeWebSocketDelegate> delegate;

@property(nonatomic, strong) NSNetServiceBrowser *netServiceBrowser;

@property(nonatomic, strong) NSNetService *netService;
@property(nonatomic, assign) Method applicationMethod;
@property(nonatomic, strong) UIWindow *fakeWindow;
@property(nonatomic, strong) SRWebSocket *webSocket;

@property(nonatomic, strong) MMTestAutoResolver *testAutoResolver;

@property(nonatomic, strong) MMResolveTestServerViewController *controller;

@property(nonatomic, strong) id <UIApplicationDelegate> applicationDelegate;

@property(nonatomic) Method customAppDelegate;

+ (instancetype)fakeManager;

- (void)start;

- (void)launchWebSocketsForService:(NSNetService *)service;

@end