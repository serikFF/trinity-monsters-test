//
//  ArticleDetailViewController.swift
//  News
//
//  Created by Sergei Rosliakov on 26.08.2020.
//

import SDWebImage
import UIKit

final class ArticleDetailViewController: ViewController {
    
    // MARK: - Outlets
    
    @IBOutlet private var imageView: UIImageView!
    @IBOutlet private var dateLabel: UILabel!
    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var descriptionLabel: UILabel!
    
    // MARK: - Private properties
    
    private let article: Article
    
    // MARK: - Init
    
    init(article: Article) {
        self.article = article
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.sd_setImage(
            with: URL(string: article.urlToImage ?? ""),
            placeholderImage: UIImage(named: "placeholder")
        )
        dateLabel.text = DateTimeFormatter.default.string(from: article.publishedAt ?? Date())
        titleLabel.text = article.title
        descriptionLabel.text = article.description
    }
    
    // MARK: - Actions
    
    @IBAction func openDidTap(_ sender: UIButton) {
        if let url = URL(string: article.url) {
            UIApplication.shared.open(url)
        }
    }
}
