//
//  RealmDAOMock.swift
//  NewsTests
//
//  Created by Sergei Rosliakov on 26.08.2020.
//

import Foundation

import DAO

final class RealmDAOMock<Model: Entity, RealmModel: RLMEntry>: RealmDAO<Model, RealmModel> {
    
    var entities: [Model] = []
    
    convenience init() {
        let ranslator = RealmTranslator<Model, RealmModel>()
        let configuration = RealmConfiguration()
        self.init(ranslator, configuration: configuration)
    }
    
    public override init(
        _ translator: RealmTranslator<Model, RealmModel>,
        configuration: RealmConfiguration) {
        
        super.init(translator, configuration: configuration)
    }
    
    override func persist(_ entity: Model) throws {
        self.entities = [entity]
    }
    
    override func persist(_ entities: [Model]) throws {
        self.entities = entities
    }
    
    override func read(_ entityId: String) -> Model? {
        return entities.first(where: { $0.entityId == entityId })
    }
    
    override func read() -> [Model] {
        return entities
    }
    
    override func read(predicatedBy predicate: NSPredicate?) -> [Model] {
        return entities
    }
    
    override func read(orderedBy field: String?, ascending: Bool) -> [Model] {
        return entities
    }
    
    override func read(
        predicatedBy predicate: NSPredicate?,
        orderedBy field: String?,
        ascending: Bool = true) -> [Model] {
        
        return entities
    }
    
    override func erase() throws {
        entities.removeAll()
    }
    
    override func erase(_ entityId: String) throws {
        entities.removeAll(where: { $0.entityId == entityId })
    }
    
}

