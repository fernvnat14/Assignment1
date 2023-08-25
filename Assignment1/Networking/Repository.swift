//
//  GithubRepository.swift
//  Assignment1
//
//  Created by A667271 A667271 on 24/8/2566 BE.
//

import Foundation

struct Repository: Decodable {
    let avatar: String
    let fullname: String

    enum CodingKeys: String, CodingKey {
        case avatar = "avatar_url"
        case fullname = "full_name"
    }
}
