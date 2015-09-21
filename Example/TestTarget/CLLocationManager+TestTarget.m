//
// Created by Marek Mościchowski on 13/05/15.
// Copyright (c) 2015 Marek Mościchowski. All rights reserved.
//

#import "CLLocationManager+TestTarget.h"
#import "MMFakeWebSocket.h"
#import "MMTestEventAggregateImpl.h"
#import "UIApplication+TestTarget.h"
#import "MMGameController.h"


@implementation CLLocationManager (TestTarget)

- (void)startRangingBeaconsInRegion:(CLBeaconRegion *)region {
  MMTestEventAggregateImpl *aggregate = [MMTestEventAggregateImpl eventAggregate];
  aggregate.locationManager = self;
  [MMGameController instance].eventAggregate = aggregate;
}

@end