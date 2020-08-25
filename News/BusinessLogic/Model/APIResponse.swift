//
//  APIResponse.swift
//  News
//
//  Created by Sergei Rosliakov on 25.08.2020.
//

import Foundation

struct APIResponse: Decodable {
    let articles: [Article]
    let totalResults: Int
    let status: String
}
