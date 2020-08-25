//
//  Article.swift
//  News
//
//  Created by Sergei Rosliakov on 25.08.2020.
//

import DAO
import Foundation

struct Source: Decodable {
    var name: String?
}

final class Article: Entity, Decodable {
    var author: String?
    var title: String
    var description: String
    var url: String
    var urlToImage: String?
    var publishedAt: Date?
    var source: Source
    
    init(
        author: String?,
        title: String,
        description: String,
        url: String,
        urlToImage: String?,
        publishedAt: Date?,
        sourceName: String
        ) {
        
        self.author = author
        self.title = title
        self.description = description
        self.url = url
        self.urlToImage = urlToImage
        self.publishedAt = publishedAt
        self.source = Source(name: sourceName)
        
        super.init(entityId: "\(title)\(url)")
    }
    
    required init() {
        self.author = ""
        self.title = ""
        self.description = ""
        self.url = ""
        self.urlToImage = nil
        self.publishedAt = nil
        self.source = Source(name: nil)
        
        super.init()
    }
}
