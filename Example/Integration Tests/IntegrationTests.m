//
//  IntegrationTests.m
//  MMTestServerPlugin
//
//  Created by Marek Moscichowski on 14.05.15.
//  Copyright (c) 2015 Marek Mościchowski. All rights reserved.
//

#import <Specta/Specta.h>
#import <KIF/KIF.h>
#import <Expecta/Expecta.h>
#import "UIApplication+TestTarget.h"
#import "AFHTTPSessionManager.h"

SpecBegin(Integration_Test)

  describe(@"Integration test", ^{
      __block NSString *address;
      beforeAll(^{
          [tester waitForTimeInterval:1.0];
          address = [UIApplication establishedFakeServerAddress];
          if (address == nil) {
            UIView *view = [tester waitForViewWithAccessibilityLabel:@"Fake Server Table View"];
            [tester waitForTimeInterval:1.0];
            UITableView *tableView = (UITableView *) view;
            UITableViewCell *cell = [tableView cellForRowAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:0]];
            [tester tapViewWithAccessibilityLabel:cell.textLabel.text];
            address = [UIApplication establishedFakeServerAddress];
          }
      });

//      it(@"Should allow to access location data if asked", ^{
//          @try {
//            [tester waitForTappableViewWithAccessibilityLabel:@"Allow"];
//            [tester tapViewWithAccessibilityLabel:@"Allow"];
//          }
//          @catch(NSException *exception) {
//            NSLog(@"TEST");
//          }
//
//
//      });

      it(@"Should have address of fake server", ^{
          XCTAssertNotNil(address);
      });

      it(@"Should show beacon view with proper values when immediate beacon discovered", ^{
          NSString *string = [NSString stringWithFormat:@"http://%@:3000", address];
          NSLog(@"string = %@", string);
          AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:string]];
          [manager GET:@"/1" parameters:nil success:nil failure:nil];
          [tester waitForTimeInterval:1.0];
          [tester waitForViewWithAccessibilityLabel:@"Major" value:@"Major: 34293" traits:UIAccessibilityTraitStaticText];
          (UILabel *) [tester waitForViewWithAccessibilityLabel:@"Minor" value:@"Minor: 30087" traits:UIAccessibilityTraitStaticText];
      });

      it(@"Should hide beacon view when beacon far discovered", ^{
          AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://%@:3000", address]]];
          [manager GET:@"/2" parameters:nil success:nil failure:nil];

          [tester waitForAbsenceOfViewWithAccessibilityLabel:@"Major"];
          [tester waitForAbsenceOfViewWithAccessibilityLabel:@"Minor"];
      });
  });

SpecEnd
