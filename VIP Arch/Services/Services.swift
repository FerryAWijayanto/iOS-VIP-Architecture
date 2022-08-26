//
//  Services.swift
//  VIP Arch
//
//  Created by Ferry Adi Wijayanto on 16/08/22.
//

import Foundation

enum GhibliError: String, Error {
    case InvalidURL
    case InvalidData
    case InvalidResponse
    case FailedToParsedJSON
}

protocol GhibliServiceProtocol {
    func getGhibliData(completion: @escaping (Result<[GhibliResponse], GhibliError>) -> Void)
}

class GhibliService: GhibliServiceProtocol {
    
    func getGhibliData(completion: @escaping (Result<[GhibliResponse], GhibliError>) -> Void) {

        let jsonData = json.data(using: .utf8)!
        
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            
            let movies = try decoder.decode([GhibliResponse].self, from: jsonData)
            completion(.success(movies))
        } catch {
            completion(.failure(.FailedToParsedJSON))
        }
    }
}
