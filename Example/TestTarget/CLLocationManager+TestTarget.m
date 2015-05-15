//
// Created by Marek Mościchowski on 13/05/15.
// Copyright (c) 2015 Marek Mościchowski. All rights reserved.
//

#import "CLLocationManager+TestTarget.h"
#import "MMFakeWebSocket.h"
#import "MMTestEventAggregate.h"
#import "UIApplication+TestTarget.h"


@implementation CLLocationManager (TestTarget)

- (void)startRangingBeaconsInRegion:(CLBeaconRegion *)region {
  MMTestEventAggregate *aggregate = [MMTestEventAggregate eventAggregate];
  aggregate.locationManager = self;
  [UIApplication fakeManager].eventAggregate = aggregate;
}

@end