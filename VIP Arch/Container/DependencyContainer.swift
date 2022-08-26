//
//  DependencyContainer.swift
//  VIP Arch
//
//  Created by Ferry Adi Wijayanto on 16/08/22.
//

import Foundation

protocol ViewControllerFactory {
    func makeGhibliViewController() -> GhibliViewController
}

class DependencyContainer {}

extension DependencyContainer: ViewControllerFactory {
    func makeGhibliViewController() -> GhibliViewController {
        GhibliViewController(factory: AppInjector.GhibliInjector())
    }
}
