//
//  NetworkClient.swift
//  GitReposSearch
//
//  Created by Azza on 23/05/2021.
//

import Foundation
import Moya

enum HttpErrors {
    case failure(error: String?)
}

class RequestManager {
    func request<Target: TargetType, Response: Codable>(for targetType: Target.Type,
                                                        responseModel: Response.Type,
                                                        service: Target,
                                                        completion: @escaping (Response?, HttpErrors?) -> Void) {
        
        let provider = MoyaProvider<Target>()
        provider.request(service) { result in
            switch result {
            case .success(let moyaResponse):
                do {
                    let response = try JSONDecoder().decode(responseModel, from: moyaResponse.data)
                    completion(response, nil)
                } catch {
                    completion(nil, nil)
                }
            case .failure(let error):
                completion(nil, .failure(error: error.errorDescription))
            }
        }
    }
}

