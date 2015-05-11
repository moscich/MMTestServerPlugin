//
// Created by Marek Mościchowski on 11/05/15.
// Copyright (c) 2015 Miquido. All rights reserved.
//

#import "UIApplication+TestTarget.h"
#import "MMFakeWebSocket.h"

@implementation UIApplication (TestTarget)

+ (void)load{
  Method original = class_getInstanceMethod(self, @selector(setDelegate:));
  Method custom = class_getInstanceMethod(self, @selector(fakeSetDelegate:));
  method_exchangeImplementations(original, custom);
  [MMFakeWebSocket fakeManager].applicationMethod = original;
}

- (void)fakeSetDelegate:(id <UIApplicationDelegate>)delegate{
  Method original = [MMFakeWebSocket fakeManager].applicationMethod;
  Method custom = class_getInstanceMethod(self.class, @selector(fakeSetDelegate:));
  method_exchangeImplementations(custom, original);

  [self setDelegate:delegate];

  Method originalAppDelegate = class_getInstanceMethod([delegate class], @selector(application:didFinishLaunchingWithOptions:));
  Method customAppDelegate = class_getInstanceMethod([self class], @selector(fakeApplication:didFinishLaunchingWithOptions:));
  method_exchangeImplementations(originalAppDelegate, customAppDelegate);

  [MMFakeWebSocket fakeManager].applicationMethod = originalAppDelegate;
  [MMFakeWebSocket fakeManager].applicationDelegate = delegate;
  [MMFakeWebSocket fakeManager].customAppDelegate = customAppDelegate;
}

- (BOOL)fakeApplication:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  Method original = [MMFakeWebSocket fakeManager].applicationMethod;
  Method custom = [MMFakeWebSocket fakeManager].customAppDelegate;
  method_exchangeImplementations(custom, original);
  BOOL result = [[MMFakeWebSocket fakeManager].applicationDelegate application:application didFinishLaunchingWithOptions:launchOptions];
  NSLog(@"Fake");

  [[MMFakeWebSocket fakeManager] start];

  return result;
}

@end