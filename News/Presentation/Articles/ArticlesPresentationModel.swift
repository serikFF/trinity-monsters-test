//
//  ArticlesPresentationModel.swift
//  News
//
//  Created by Sergei Rosliakov on 25.08.2020.
//

import UIKit

final class ArticlesPresentationModel {
    
    // MARK: - Properties
    
    var articles = [Article]()
    var onArticlesListUpdate: ArticlesClosure?
    var onErrorHandle: ErrorClosure?
    
    // MARK: - Private properties
    
    private let articlesService: ArticlesServiceProtocol
    private var currentPage = 1
    
    // MARK: - Init
    
    init(articlesService: ArticlesServiceProtocol = ServiceLayer.instance.articlesService) {
        self.articlesService = articlesService
    }
    
    // MARK: - Public methods
    
    func refreshData() {
        currentPage = 1
        articles.removeAll()
        loadNextPage()
    }
    
    func loadNextPage() {
        articlesService.getArticles(
            page: currentPage,
            completion: { [weak self] response in
                self?.currentPage += 1
                self?.articles.append(contentsOf: response)
                self?.onArticlesListUpdate?(self?.articles ?? [])
            },
            failure: onErrorHandle ?? {_ in}
        )
    }
}
