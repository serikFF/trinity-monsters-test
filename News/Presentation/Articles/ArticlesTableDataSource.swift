//
//  ArticlesTableDataSource.swift
//  News
//
//  Created by Sergei Rosliakov on 26.08.2020.
//

import UIKit

final class ArticlesTableDataSource: NSObject, UITableViewDataSource {
    
    var articles = [Article]()
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(ArticleCell.self, for: indexPath)
        cell.setup(with: articles[indexPath.row])
        return cell
    }
}
