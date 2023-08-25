//
//  GithubRepositories.swift
//  Assignment1
//
//  Created by A667271 A667271 on 24/8/2566 BE.
//

import Foundation

struct Repositories: Decodable {
  let count: Int
  let all: [Repository]
  
  enum CodingKeys: String, CodingKey {
    case count
    case all = "items"
  }
}
