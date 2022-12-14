//
//  GhibliModel.swift
//  VIP Arch
//
//  Created by Ferry Adi Wijayanto on 16/08/22.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the VIP Swift Xcode Templates(https://github.com/Andrei-Popilian/VIP_Design_Xcode_Template)
//  so you can apply clean architecture to your iOS and MacOS projects,
//  see more http://clean-swift.com
//


import Foundation

enum GhibliModel {
    
    enum Request {
        case fetchMovies
    }
    
    enum Response {
        case movies([GhibliResponse])
        case error(String)
    }
    
    enum ViewModel {
        case movies([GhibliResponse])
        case error(String)
    }
    
    enum Route {
        case gotoDetailScreen(withMovie: GhibliResponse)
    }
}
