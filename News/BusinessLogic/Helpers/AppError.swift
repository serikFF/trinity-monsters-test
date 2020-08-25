//
//  AppError.swift
//  News
//
//  Created by Sergei Rosliakov on 25.08.2020.
//

import Foundation

enum AppError: Error {
    case other
    case noConnection
    case wrongData
    
    private struct Constants {
        static let noConnectionErrorCode = 13
    }
    
    var description: String {
        switch self {
        case .other:
            return "Что-то пошло не так"
        case .noConnection:
            return "Отсутствует интернет соединение"
        case .wrongData:
            return "Неверные данные"
        }
    }
    
    static func fromNSError(_ error: NSError) -> AppError {
        if error.code == Constants.noConnectionErrorCode {
            return .noConnection
        } else {
            return .other
        }
    }
}
