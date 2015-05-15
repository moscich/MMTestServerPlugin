//
//  MMViewController.m
//  MMTestServerPlugin
//
//  Created by Marek Mościchowski on 05/11/2015.
//  Copyright (c) 2014 Marek Mościchowski. All rights reserved.
//

#import "MMViewController.h"

@interface MMViewController ()

@property(nonatomic, strong) CLLocationManager *manager;

@end

@implementation MMViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  [self setupLocationManager];
  [self setupBeaconView];
}

- (void)setupLocationManager {
  self.manager = [[CLLocationManager alloc] init];
  self.manager.delegate = self;
  NSUUID *uuid = [[NSUUID alloc] initWithUUIDString:@"12345678-4321-1234-4321-123456789012"];
  CLBeaconRegion *beaconRegion = [[CLBeaconRegion alloc] initWithProximityUUID:uuid identifier:@"com.miquido.Protuction-Target"];
  [self.manager requestAlwaysAuthorization];
  [self.manager startRangingBeaconsInRegion:beaconRegion];
}

- (void)setupBeaconView {
  self.beaconView = [MMBeaconFoundView new];
  self.beaconView.hidden = NO;
  self.beaconView.delegate = self;
  self.beaconView.translatesAutoresizingMaskIntoConstraints = NO;
  [self.view addSubview:self.beaconView];
  [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.beaconView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0]];
  self.constraint = [NSLayoutConstraint constraintWithItem:self.beaconView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:600];
  [self.view addConstraint:self.constraint];
  [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.beaconView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.7 constant:0]];
  [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.beaconView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.7 constant:0]];
}

- (void)locationManager:(CLLocationManager *)manager didRangeBeacons:(NSArray *)beacons inRegion:(CLBeaconRegion *)region {
  for (CLBeacon *beacon in beacons) {
    if (beacon.proximity == CLProximityImmediate) if (!self.shown) {
      self.shown = YES;
      [self show:beacon];
    }
    if (beacon.proximity == CLProximityFar && self.shown) {
      [self dismissBeaconView];
    }
  }
}

- (void)show:(CLBeacon *)beacon {
  [self.beaconView setMajor:[beacon.major intValue]];
  [self.beaconView setMinor:[beacon.minor intValue]];

  self.constraint.constant = 0;
  self.beaconView.hidden = NO;
  [UIView animateWithDuration:1.0
                        delay:0
       usingSpringWithDamping:0.5
        initialSpringVelocity:0.5
                      options:UIViewAnimationOptionTransitionNone
                   animations:^{
                       [self.view layoutIfNeeded];

                   } completion:nil];
}

- (void)dismissBeaconView {
  self.constraint.constant = 600;

  [UIView animateWithDuration:1.5
                        delay:0
       usingSpringWithDamping:0.5
        initialSpringVelocity:0
                      options:UIViewAnimationOptionTransitionNone
                   animations:^{
                       [self.view layoutIfNeeded];

                   } completion:^(BOOL finished) {
              self.shown = NO;
              self.beaconView.hidden = YES;
          }];
}

@end
