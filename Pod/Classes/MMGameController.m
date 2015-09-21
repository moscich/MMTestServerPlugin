//
// Created by Marek Mościchowski on 21.09.15.
// Copyright (c) 2015 Marek Mościchowski. All rights reserved.
//

#import "MMGameController.h"
#import "MMTestEventAggregate.h"


@implementation MMGameController {

}


+ (MMGameController *)instance {
  static MMGameController *_instance = nil;

  @synchronized (self) {
    if (_instance == nil) {
      _instance = [[self alloc] init];
    }
  }

  return _instance;
}

- (void)startOnWindow:(UIWindow *)window {
  dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 1 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
  
    NSArray *controllers = [GCController controllers];
    self.controller = [controllers lastObject];

    self.controller.gamepad.buttonA.pressedChangedHandler = ^(GCControllerButtonInput *button, float value, BOOL pressed) {
        if(value > 0.001){
          [self.eventAggregate testEvent:@"2"];
        }
    };
    self.controller.gamepad.buttonB.pressedChangedHandler = ^(GCControllerButtonInput *button, float value, BOOL pressed) {
        if(value > 0.001){
          [self.eventAggregate testEvent:@"1"];
        }

    };
  });
}
@end