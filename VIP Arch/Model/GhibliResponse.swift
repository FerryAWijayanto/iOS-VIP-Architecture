//
//  GhibliResponse.swift
//  VIP Arch
//
//  Created by Ferry Adi Wijayanto on 16/08/22.
//

import Foundation

struct GhibliResponse: Codable {
    let id, title, description: String
    let releaseDate, image: String
}

extension GhibliResponse: Equatable {
    static func == (lhs: GhibliResponse, rhs: GhibliResponse) -> Bool {
        return lhs.id == rhs.id
    }
}
