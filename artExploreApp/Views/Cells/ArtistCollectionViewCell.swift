//
//  ArtistCollectionViewCell.swift
//  artExploreApp
//
//  Created by Nikita Savchik on 08/11/2023.
//

import UIKit
import SnapKit

class ArtistCollectionViewCell: UICollectionViewCell {
    
    private let descriptionView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 20
        return view
    }()
    
    private let firstBlurEffectView: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: .regular)
        let view = UIVisualEffectView(effect: blurEffect)
        return view
    }()
    
    private let imageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = image.bounds.height / 2
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let artistName: UILabel = {
        let label = UILabel()
        label.font = .rounded(ofSize: 30, weight: .medium)
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let artistDescription: UILabel = {
        let description = UILabel()
        description.font = .rounded(ofSize: 25, weight: .bold)
        description.textColor = .black
        description.textAlignment = .center
        description.numberOfLines = 0
        description.translatesAutoresizingMaskIntoConstraints = false
        return description
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(imageView)
        contentView.addSubview(firstBlurEffectView)
        firstBlurEffectView.contentView.addSubview(artistName)

        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        contentView.clipsToBounds = true
        contentView.layer.cornerRadius = 20
    }
    
    func configure(title: String, image: String, description: String) {
        imageView.image = UIImage(named: image)
        artistName.text = title
        artistDescription.text = description
    }
    
    private func setConstraints() {
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        firstBlurEffectView.snp.makeConstraints { make in
            make.leading.trailing.top.equalTo(imageView)
            make.height.equalTo(80)
        }
        
        artistName.snp.makeConstraints { make in
            make.edges.equalTo(firstBlurEffectView)
        }
    }
    
    private func setupSubviews(_ subview: UIView...) {
        subview.forEach { subview in
            addSubview(subview)
        }
    }
    
}
