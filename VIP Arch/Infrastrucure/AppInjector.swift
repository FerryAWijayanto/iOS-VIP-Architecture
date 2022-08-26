//
//  AppInjector.swift
//  VIP Arch
//
//  Created by Ferry Adi Wijayanto on 16/08/22.
//

import Foundation
import UIKit

struct AppInjector {}

extension AppInjector {
  
  struct GhibliInjector {}
}

extension AppInjector.GhibliInjector: GhibliFactorable {
    func makeGhibliService() -> GhibliServiceProtocol {
        GhibliService()
    }
    
    func makeInteractor(factory: InteractableFactory, viewController: GhibliDisplayLogic?) -> GhibliInteractable {
        GhibliInteractor(factory: factory, viewController: viewController)
    }
    
    func makePresenter(viewController: GhibliDisplayLogic?) -> GhibliPresentationLogic {
        GhibliPresenter(viewController: viewController)
    }
    
    func makeRouter(viewController: UIViewController?) -> GhibliRouting {
        GhibliRouter(viewController: viewController)
    }
}
