//
//  ArticlesServiceProtocol.swift
//  News
//
//  Created by Sergei Rosliakov on 25.08.2020.
//

import Foundation

protocol ArticlesServiceProtocol {
    func getArticles(
        page: Int,
        completion: @escaping ArticlesClosure,
        failure: @escaping ErrorClosure
    )
}
