//
//  User.swift
//  GitHubFollowers
//
//  Created by Alex Oliveira on 03/02/2022.
//

import Foundation

struct User: Codable {
    var login: String
    var avatarUrl: String
    var name: String?
    var location: String?
    var bio: String?
    var publicRepos: Int
    var poublicGits: Int
    var htmlUrl: String
    var following: Int
    var followers: Int
    var createdAt: String
}
