//
//  NewsTests.swift
//  NewsTests
//
//  Created by Sergei Rosliakov on 25.08.2020.
//

import XCTest
import DAO
@testable import News

class ArticlesServiceTests: XCTestCase {
    
    var articlesDAO: RealmDAOMock<Article, DBArticle>!
    var articlesService: ArticlesServiceProtocol!
    
    override func setUp() {
        super.setUp()
        
        articlesDAO = RealmDAOMock<Article, DBArticle>()
        articlesService = ArticlesService(apiClient: ApiClient(), articlesDAO: articlesDAO)
    }
    
    override func tearDown() {
        articlesService = nil
        articlesDAO = nil
        super.tearDown()
    }
    
    func testObtainArticlesFromNetwork() {
        
        let expectation = makeExpectation()
        
        var articles: [Article]?
        var error: Error?
        
        articlesService.getArticles(page: 1) { response in
            articles = response
            expectation.fulfill()
        } failure: { err in
            error = err
        }
        
        wait()
        
        XCTAssertNotNil(articles)
        XCTAssertNil(error)
        XCTAssertNotEqual(articlesDAO.entities.count, 0)
    }
    
    func testObtainArticlesFromNetworkWithError() {
        
        let expectation = makeExpectation()
        
        var articles: [Article]?
        var error: Error?
        
        articlesService.getArticles(page: 0) { response in
            articles = response
        } failure: { err in
            error = err
            expectation.fulfill()
        }
        
        wait()
        
        XCTAssertNil(articles)
        XCTAssertNotNil(error)
        XCTAssertEqual(articlesDAO.entities.count, 0)
    }
}


extension XCTestCase {
    
    @discardableResult
    func makeExpectation() -> XCTestExpectation {
        return self.expectation(description: "success")
    }
    
    func wait(_ timeout: TimeInterval = 10) {
        self.waitForExpectations(timeout: timeout, handler: nil)
    }
    
}
