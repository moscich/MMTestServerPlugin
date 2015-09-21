//
// Created by Marek Mościchowski on 11/05/15.
// Copyright (c) 2015 Miquido. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class MMFakeWebSocket;
@class MMGameController;

@interface UIApplication (TestTarget)


+ (MMFakeWebSocket *)fakeManager;
+ (MMGameController *)gameController;

+ (NSString *)establishedFakeServerAddress;
@end