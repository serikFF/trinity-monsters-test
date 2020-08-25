//
//  APIClient.swift
//  News
//
//  Created by Sergei Rosliakov on 25.08.2020.
//

import Alamofire
import Foundation

final class ApiClient: ApiClientProtocol {
    
    private struct Constants {
        static let apiKey = "73bad5a06c4a4748bc114d19682d4148"
        static let baseURL = "https://newsapi.org/v2/"
        static let sources = "lenta,rbc"
        static let languages = "ru"
    }
    
    // MARK: - ApiClientProtocol
    
    func getArticles(pagination: Pagination, completion: @escaping ResponseClosure, failure: @escaping ErrorClosure) {

        AF.request("\(Constants.baseURL)everything", parameters: makeParams(with: pagination))
            .responseJSON { response in

            switch response.result {
            case .success:
                guard let data = response.data else {
                    failure(AppError.other)
                    return
                }
                completion(data)

            case .failure(let error):
                failure(AppError.fromNSError(error as NSError))
            }
        }
    }
    
    // MARK: - Helpers
    
    private func makeParams(with pagination: Pagination) -> [String : Any] {
        return [
            "page" : pagination.page,
            "pageSize" : pagination.pageSize,
            "sources" : Constants.sources,
            "languages" : Constants.languages,
            "apiKey" : Constants.apiKey
        ]
    }
}
