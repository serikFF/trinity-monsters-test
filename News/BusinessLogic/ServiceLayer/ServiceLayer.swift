//
//  ServiceLayer.swift
//  News
//
//  Created by Sergei Rosliakov on 25.08.2020.
//

import Foundation

final class ServiceLayer {
    static let instance = ServiceLayer()

    let articlesService: ArticlesServiceProtocol
    let apiClient: ApiClientProtocol
    
    
    init() {
        apiClient = ApiClient()
        articlesService = ArticlesService(apiClient: apiClient)
    }
}
