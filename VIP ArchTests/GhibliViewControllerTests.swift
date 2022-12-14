//
//  GhibliViewControllerTests.swift
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


final class GhibliViewControllerTests: XCTestCase {
    
    private var interactor: GhibliInteractorSpy!
    private var viewController: GhibliViewController!
    private var presenter: GhibliPresenterSpy!
    private var router: GhibliRouterSpy!
    
    override func setUp() {
        viewController = GhibliViewController(factory: self)
    }
    
    override func tearDown() {
        interactor = nil
        viewController = nil
        router = nil
        presenter = nil
    }
}



// MARK: - Tests
extension GhibliViewControllerTests {
    
    func testFetchMoviesWhenViewDidLoad() {
        // Given
        interactor.request(.fetchMovies)
        
        // When
        viewController.viewDidLoad()
        
        // Then
        XCTAssert(interactor.fetchMoviesCalled, "Should fetch movies when the view is loaded")
    }
}


// MARK: - LoginFactorable, Injector
extension GhibliViewControllerTests: GhibliInteractorFactorable, GhibliRouterFactorable, GhibliPresenterFactorable, GhibliFactorable {
    func makeGhibliService() -> GhibliServiceProtocol {
        GhibliService()
    }
    
    func makeInteractor(factory: InteractableFactory,
                        viewController: GhibliDisplayLogic?) -> GhibliInteractable {
        interactor = GhibliInteractorSpy()
        return interactor
    }
    
    func makeRouter(viewController: UIViewController?) -> GhibliRouting {
        router = GhibliRouterSpy()
        return router
    }
    
    func makePresenter(viewController: GhibliDisplayLogic?) -> GhibliPresentationLogic {
        presenter = GhibliPresenterSpy()
        return presenter
    }
}


// MARK: - Spy Classes Setup
private extension GhibliViewControllerTests {
    
    final class GhibliInteractorSpy: GhibliInteractable {
        
        var fetchMoviesCalled = false
        
        var dataSource: [GhibliResponse] = []
        
        func request(_ request: GhibliModel.Request) {
            switch request {
            case .fetchMovies:
                fetchMoviesCalled = true
                
                dataSource = [GhibliResponse(id: "1", title: "Spy x Family", description: "Spy x Family desc", releaseDate: "2021", image: "some https")]
            }
        }
    }
    
    final class GhibliRouterSpy: GhibliRouting {
        
        func routeTo(_ route: GhibliModel.Route) {
            
        }
    }
    
    final class GhibliPresenterSpy: GhibliPresentationLogic {
        
        var items: [GhibliResponse]?
        var passError: String?
        
        func presentResponse(_ response: GhibliModel.Response) {
            switch response {
            case let .movies(movies):
                items = movies
            case let .error(error):
                passError = error
            }
        }
    }
}
