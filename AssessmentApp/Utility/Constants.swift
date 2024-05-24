//
//  Constants.swift
//  AssessmentApp
//
//  Created by Virender Swami on 24/05/24.
//

import Foundation

struct Constants {
    struct API {
        static let baseURL = "https://jsonplaceholder.typicode.com"
        static let postsEndpoint = "/posts"
        static let maxPageLimit = 10

        static func postsURL(page: Int, limit: Int) -> URL {
            return URL(string: "\(baseURL)\(postsEndpoint)?_page=\(page)&_limit=\(limit)")!
        }
    }
}
