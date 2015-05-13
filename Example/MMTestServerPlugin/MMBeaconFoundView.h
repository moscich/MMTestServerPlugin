//
// Created by Marek Mościchowski on 13/05/15.
// Copyright (c) 2015 Marek Mościchowski. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MMBeaconFoundViewDelegate
- (void)dismissBeaconView;
@end

@interface MMBeaconFoundView : UIView

@property(nonatomic, weak) id <MMBeaconFoundViewDelegate> delegate;

@property(nonatomic, strong) UILabel *majorLabel;
@property(nonatomic, strong) UILabel *minorLabel;
@end