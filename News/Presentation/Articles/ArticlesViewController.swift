//
//  ArticlesViewController.swift
//  News
//
//  Created by Sergei Rosliakov on 25.08.2020.
//

import UIKit


final class ArticlesViewController: ViewController {
    
    // MARK: - Outlets
    
    @IBOutlet private var tableView: UITableView!
    @IBOutlet private var activityIndicator: UIActivityIndicatorView!
    
    // MARK: - Private properties
    
    private var pullToRefreshTop: RMRPullToRefresh?
    private var pullToRefreshBottom: RMRPullToRefresh?

    private let presentationModel: ArticlesPresentationModel
    private let tableDataSource = ArticlesTableDataSource()
    
    // MARK: - Init
    
    init(presentationModel: ArticlesPresentationModel = ArticlesPresentationModel()) {
        self.presentationModel = presentationModel
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Лента новостей"
        
        setupPresentationModel()
        setupTableView()
        setupPullToRefresh()
        
        self.presentationModel.refreshData()
    }
    
    // MARK: - Private methods
    
    private func setupPresentationModel() {
        presentationModel.onArticlesListUpdate = { [weak self] articles in
            self?.activityIndicator.isHidden = true
            self?.tableView.isHidden = false
            self?.tableDataSource.articles = articles
            self?.tableView.reloadData()
        }
        
        presentationModel.onErrorHandle = { [weak self] error in
            self?.handle(error: error)
        }
    }
    
    private func setupTableView() {
        tableView.registerClass(ArticleCell.self)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 44
        tableView.dataSource = tableDataSource
        tableView.delegate = self
    }
    
    private func setupPullToRefresh() {
        pullToRefreshTop = RMRPullToRefresh.init(scrollView: tableView, position: .top) { [weak self] in
            self?.pullToRefreshTop?.stopLoading()
            self?.presentationModel.refreshData()
        }
        pullToRefreshTop?.setupDefaultSettings()
        
        pullToRefreshBottom = RMRPullToRefresh.init(scrollView: tableView, position: .bottom) { [weak self] in
            self?.pullToRefreshBottom?.stopLoading()
            self?.presentationModel.loadNextPage()
        }
        pullToRefreshBottom?.setupDefaultSettings()
    }
    
    // MARK: - Error handling
    
    private func handle(error: AppError) {
        let alert = UIAlertController(title: "Ошибка", message: error.description, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}

// MARK: - UITableViewDelegate
extension ArticlesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let vc = ArticleDetailViewController(article: tableDataSource.articles[indexPath.row])
        navigationController?.pushViewController(vc, animated: true)
    }
}
