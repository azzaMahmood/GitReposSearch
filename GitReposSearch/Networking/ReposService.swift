//
//  ReposService.swift
//  GitReposSearch
//
//  Created by Azza on 23/05/2021.
//

import Foundation
import Moya
import Alamofire

enum ReposService: TargetType {
    case repositories(keyword: String, page: Int)
    
    var baseURL: URL {
        return URL (string: "https://api.github.com/")!
    }
    
    var path: String {
        return "search/repositories"
    }
    
    var method: Alamofire.HTTPMethod {
        return .get
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .repositories(let keyword, let page):
            return Task.requestParameters(parameters: ["page": page, "q":keyword, "type": "users"], encoding: URLEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        return nil
    }
}

