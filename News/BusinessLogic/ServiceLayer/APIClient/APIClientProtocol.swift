//
//  APIClientProtocol.swift
//  News
//
//  Created by Sergei Rosliakov on 25.08.2020.
//

import Foundation

protocol ApiClientProtocol {
    func getArticles(
        pagination: Pagination,
        completion: @escaping ResponseClosure,
        failure: @escaping ErrorClosure
    )
}
