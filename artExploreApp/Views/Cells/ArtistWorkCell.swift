//
//  ArtistWorkCell.swift
//  artExploreApp
//
//  Created by Nikita Savchik on 12/11/2023.
//

import UIKit
import SnapKit

class ArtistWorkCell: UICollectionViewCell {
    
    private let imageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleToFill
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(imageView)
        setConstraints()
    }
    
    override func layoutSubviews() {
        contentView.clipsToBounds = true
        contentView.layer.cornerRadius = 20
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(title: String, image: String) {
        imageView.image = UIImage(named: image)
    }
    
    private func setConstraints() {
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
