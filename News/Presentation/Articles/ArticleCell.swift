//
//  ArticleCell.swift
//  News
//
//  Created by Sergei Rosliakov on 25.08.2020.
//

import SDWebImage
import UIKit

final class ArticleCell: UITableViewCell {
            
    // MARK: - Outlets
    
    @IBOutlet private var articleImageView: UIImageView!
    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var sourceLabel: UILabel!
    @IBOutlet private var publicationDateLabel: UILabel!
    
    // MARK: - Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        articleImageView.sd_cancelCurrentImageLoad()
        articleImageView.image = nil
        titleLabel.text = ""
        sourceLabel.text = ""
        publicationDateLabel.text = ""
        
        super.prepareForReuse()
    }
    
    // MARK: - Public methods
    
    func setup(with model: Article) {
        articleImageView.sd_setImage(
            with: URL(string: model.urlToImage ?? ""),
            placeholderImage: UIImage(named: "placeholder"),
            options: SDWebImageOptions.init(arrayLiteral: [.progressiveLoad]))
        titleLabel.text = model.title
        sourceLabel.text = "Источник: \(model.source.name ?? model.author ?? "")"
        publicationDateLabel.text = DateTimeFormatter.default.string(from: model.publishedAt ?? Date())
    }
}
