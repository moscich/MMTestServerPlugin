//
//  MMViewController.h
//  MMTestServerPlugin
//
//  Created by Marek Mościchowski on 05/11/2015.
//  Copyright (c) 2014 Marek Mościchowski. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import "MMBeaconFoundView.h"

@interface MMViewController : UIViewController <CLLocationManagerDelegate, MMBeaconFoundViewDelegate>

@property(nonatomic) BOOL shown;
@property(nonatomic, strong) NSLayoutConstraint *constraint;
@property(nonatomic, strong) MMBeaconFoundView *beaconView;
@end
