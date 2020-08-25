//
//  DateTimeFormatter.swift
//  News
//
//  Created by Sergei Rosliakov on 26.08.2020.
//

import Foundation

enum DateTimeFormatter {
    static let `default`: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy HH:mm"
        
        return dateFormatter
    }()
}
