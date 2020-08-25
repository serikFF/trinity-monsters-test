//
//  ArticleDAOTranslator.swift
//  News
//
//  Created by Sergei Rosliakov on 25.08.2020.
//

import DAO
import RealmSwift

final class ArticleDAOTranslator: RealmTranslator<Article, DBArticle> {

    override func fill(_ entity: Article, fromEntry: DBArticle) {
        entity.entityId = fromEntry.entryId
        entity.author = fromEntry.author
        entity.title = fromEntry.title
        entity.description = fromEntry.descr
        entity.url = fromEntry.url
        entity.urlToImage = fromEntry.urlToImage
        entity.publishedAt = fromEntry.publishedAt
        entity.source = Source(name: fromEntry.sourceName)
    }

    override func fill(_ entry: DBArticle, fromEntity: Article) {
        if entry.entryId != fromEntity.entityId {
            entry.entryId = fromEntity.entityId
        }
        entry.title = fromEntity.title
        entry.author = fromEntity.author
        entry.descr = fromEntity.description
        entry.url = fromEntity.url
        entry.urlToImage = fromEntity.urlToImage
        entry.publishedAt = fromEntity.publishedAt
        entry.sourceName = fromEntity.source.name ?? ""
    }
}

