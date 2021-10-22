//
//  SportsHandlerTests.swift
//  SportyAppTests
//
//  Created by Ghadeer El-Mahdy on 4/30/20.
//  Copyright © 2020 mad40. All rights reserved.
//

import XCTest

class SportsHandlerTests: XCTestCase {
    var sportsHandlerWithoutError:MockSportsHandler?
     var sportsHandlerWithError:MockSportsHandler?
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sportsHandlerWithoutError = MockSportsHandler(shouldReturnError: false)
        sportsHandlerWithError = MockSportsHandler(shouldReturnError: true)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

 func testMockSportsWithoutError() {
        
    sportsHandlerWithoutError?.loadDataFromURL() {sports, error in
            
        if error != nil {
                XCTFail()
            }else{
                XCTAssertEqual(sports?.count, 3, "Mocks Faild")
            }
        }
    }
    func testMockSportsWithError() {
        
    sportsHandlerWithError?.loadDataFromURL() {sports, error in
            
        if error != nil {
                XCTFail()
            }else{
                XCTAssertEqual(sports?.count, 3, "Mocks Faild")
            }
        }
    }

}
