//
//  IntegrationTests.m
//  MMTestServerPlugin
//
//  Created by Marek Moscichowski on 14.05.15.
//  Copyright (c) 2015 Marek Mościchowski. All rights reserved.
//

#import <KIF/KIF.h>
#import "UIAccessibilityElement-KIFAdditions.h"

@interface IntegrationTests : KIFTestCase

@end

@implementation IntegrationTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"TestServiceName"];
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"TestServiceType"];
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"TestServiceDomain"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    [UIView setAnimationsEnabled:NO];
    UIView *view = [tester waitForViewWithAccessibilityLabel:@"Fake Server Table View"];
    [tester waitForTimeInterval: 3.0];
    UITableView *tableView = (UITableView *) view;
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:0]];
    [tester tapViewWithAccessibilityLabel:cell.textLabel.text];
//    [tester waitForCellAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:0] inTableViewWithAccessibilityIdentifier:@"Fake Server Table View"];
//    [tester tapRowAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:0] inTableViewWithAccessibilityIdentifier:@"Fake Server Table View"];
//    XCTestExpectation *expectation = [self expectationWithDescription:@"test"];
//            // This is an example of a functional test case.
//    XCTAssert(YES, @"Pass");
//    [self waitForExpectationsWithTimeout:10 handler:nil];
};

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
