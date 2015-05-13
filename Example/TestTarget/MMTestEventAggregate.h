//
// Created by Marek Mościchowski on 13/05/15.
// Copyright (c) 2015 Marek Mościchowski. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <MMTestServerPlugin/MMFakeWebSocket.h>
#import "SRWebSocket.h"


@interface MMTestEventAggregate : NSObject <MMTestEventAggregate>
@property(nonatomic, weak) CLLocationManager *locationManager;

+ (instancetype)eventAggregate;
@end