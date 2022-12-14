//
//  GhibliRouterTests.swift
//  VIP Arch
//
//  Created by Ferry Adi Wijayanto on 16/08/22.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the VIP Swift Xcode Templates(https://github.com/Andrei-Popilian/VIP_Design_Xcode_Template)
//  so you can apply clean architecture to your iOS and MacOS projects,
//  see more http://clean-swift.com
//

import XCTest
@testable import VIP_Arch


final class GhibliRouterTests: XCTestCase {
    
    private var router: GhibliRouter!
    private var viewController: GhibliViewControllerSpy!
    
    override func setUp() {
        viewController = GhibliViewControllerSpy()
        router = GhibliRouter(viewController: viewController)
    }
    
    override func tearDown() {
        viewController = nil
        router = nil
    }
}


// MARK: - Tests
extension GhibliRouterTests {
    
    func textExample() {
        // Given
        let movie = GhibliResponse(id: "1", title: "A TITLE", description: "A desc", releaseDate: "100BC", image: "imgs")
        router.routeTo(.gotoDetailScreen(withMovie: movie))
        
        // When
        viewController.pushMovieToDetail()
        
        // Then
        XCTAssertTrue(viewController.isPushViewController)
    }
}


// MARK: - Spy Classes Setup
private extension GhibliRouterTests {
    
    final class GhibliViewControllerSpy: UIViewController {
        var dismissExpectation: XCTestExpectation!
        var pushNavigationExpectation: XCTestExpectation!
        var isPushViewController = false
        var isDismissed: Bool = false
        
        override func dismiss(animated flag: Bool, completion: (() -> Void)? = nil) {
            isDismissed = true
            dismissExpectation.fulfill()
        }
        
        func pushMovieToDetail() {
            isPushViewController = true
            pushNavigationExpectation.fulfill()
        }
    }
}
