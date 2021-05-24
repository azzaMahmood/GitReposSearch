//
//  AllReposResponse.swift
//  GitReposSearch
//
//  Created by Azza on 23/05/2021.
//

import Foundation

struct AllReposResponse: Codable {
    let items: [RepoDetails]?
    let totalCount: Int?

    enum CodingKeys: String, CodingKey {
        case items
        case totalCount = "total_count"
    }
}
