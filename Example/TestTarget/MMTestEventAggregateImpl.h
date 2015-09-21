//
// Created by Marek Mościchowski on 13/05/15.
// Copyright (c) 2015 Marek Mościchowski. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <MMTestServerPlugin/MMFakeWebSocket.h>
#import "SRWebSocket.h"
#import "MMTestEventAggregate.h"


@interface MMTestEventAggregateImpl : NSObject <MMTestEventAggregate>
@property(nonatomic, weak) CLLocationManager *locationManager;

@property(nonatomic, strong) GCController *controller;

+ (instancetype)eventAggregate;
@end