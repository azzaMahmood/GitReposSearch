//
//  RepoDetails.swift
//  GitReposSearch
//
//  Created by Azza on 23/05/2021.
//

import Foundation

struct RepoDetails: Codable {
    
    var name: String?
    var owner: Owner?
    var description: String?
    var stargazersCount: Int?
    var language: String?

    enum CodingKeys: String, CodingKey {
        case name
        case owner
        case description
        case stargazersCount = "stargazers_count"
        case language
    }
}
