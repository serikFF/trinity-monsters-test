//
//  DBArticle.swift
//  News
//
//  Created by Sergei Rosliakov on 25.08.2020.
//

import DAO
import RealmSwift

class DBArticle: RLMEntry {

    @objc dynamic var author: String?
    @objc dynamic var title: String = ""
    @objc dynamic var descr: String = ""
    @objc dynamic var url: String = ""
    @objc dynamic var urlToImage: String?
    @objc dynamic var publishedAt: Date?
    @objc dynamic var sourceName: String = ""
}
