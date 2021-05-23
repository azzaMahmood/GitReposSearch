//
//  Owners.swift
//  GitReposSearch
//
//  Created by Azza on 23/05/2021.
//

import Foundation

import Foundation

struct Owner: Codable {
    var login: String?
    var avatarURL: String?

    enum CodingKeys: String, CodingKey {
        case login
        case avatarURL = "avatar_url"
    }
}
