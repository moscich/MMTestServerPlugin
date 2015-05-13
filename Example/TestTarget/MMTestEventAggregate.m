//
// Created by Marek Mościchowski on 13/05/15.
// Copyright (c) 2015 Marek Mościchowski. All rights reserved.
//

#import "MMTestEventAggregate.h"

@interface FakeBeacon : NSObject

@property (nonatomic, strong) NSUUID *proximityUUID;
@property (nonatomic, strong) NSNumber *major;
@property (nonatomic, strong) NSNumber *minor;
@property( nonatomic) CLProximity proximity;

@end

@implementation FakeBeacon

@end

@implementation MMTestEventAggregate {

}

+ (instancetype)eventAggregate {
  static MMTestEventAggregate *testEventAggregate = nil;
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
      testEventAggregate = [[self alloc] init];
  });
  return testEventAggregate;
}

- (void)findImmediateBeacon {
  FakeBeacon *beacon = [FakeBeacon new];
  beacon.minor = @30087;
  beacon.major = @34293;
  beacon.proximityUUID = [[NSUUID alloc] initWithUUIDString:@"12345678-4321-1234-4321-123456789012"];
  beacon.proximity = CLProximityImmediate;
  [self.locationManager.delegate locationManager:self.locationManager didRangeBeacons:@[beacon] inRegion:nil];
}

- (void)findFarBeacon{
  FakeBeacon *beacon = [FakeBeacon new];
  beacon.minor = @30087;
  beacon.major = @34293;
  beacon.proximityUUID = [[NSUUID alloc] initWithUUIDString:@"12345678-4321-1234-4321-123456789012"];
  beacon.proximity = CLProximityFar;
  [self.locationManager.delegate locationManager:self.locationManager didRangeBeacons:@[beacon] inRegion:nil];
}

- (void)testEvent:(id)message {
  if([message isEqualToString:@"1"]){
    [self findImmediateBeacon];
  }
  if([message isEqualToString:@"2"]){
    [self findFarBeacon];
  }
}


@end