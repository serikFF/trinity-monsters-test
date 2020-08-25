//
//  ArticlesService.swift
//  News
//
//  Created by Sergei Rosliakov on 25.08.2020.
//

import Alamofire
import DAO
import Foundation
import RealmSwift

final class ArticlesService: ArticlesServiceProtocol {
    
    private let decoder: JSONDecoder
    private let apiClient: ApiClientProtocol
    private let articleDAOTranslator: ArticleDAOTranslator
    private let articlesDAO: RealmDAO<Article, DBArticle>

    init(apiClient: ApiClientProtocol = ServiceLayer.instance.apiClient) {
        self.apiClient = apiClient
        
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        self.decoder = decoder
        
        articleDAOTranslator = ArticleDAOTranslator()
        articlesDAO = RealmDAO.init(articleDAOTranslator)
    }
    
    func getArticles(
        page: Int,
        completion: @escaping ArticlesClosure,
        failure: @escaping ErrorClosure
    ) {
        apiClient.getArticles(
            pagination: Pagination(page: page),
            completion: { data in
                do {
                    let response = try self.decoder.decode(APIResponse.self, from: data)
                    try self.articlesDAO.persist(response.articles)
                    
                    completion(response.articles)
                } catch let error {
                    debugPrint(error)
                    failure(AppError.wrongData)
                }
            },
            failure: { error in
                switch error {
                case .noConnection:
                    let articles = self.articlesDAO.read(orderedBy: "publishedAt", ascending: false)
                    if articles.count > 0 {
                        completion(articles)
                    }
                    failure(.noConnection)
                    
                default:
                    failure(error)
                }
            }
        )
    }
}
