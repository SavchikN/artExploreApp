//
//  ImageView.swift
//  artExploreApp
//
//  Created by Nikita Savchik on 12/11/2023.
//

import UIKit

class ImageView: UIView {
    
    private let blurEffectView: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: .dark)
        let view = UIVisualEffectView(effect: blurEffect)
        return view
    }()
    
    lazy var imageView: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 20
        image.contentMode = .scaleToFill
        image.backgroundColor = .systemGray
        return image
    }()
    
    lazy var artistName: UILabel = {
        let label = UILabel()
        label.font = .rounded(ofSize: 30, weight: .regular)
        label.textColor = .white
        label.textAlignment = .left
        return label
    }()
    
    lazy var artistSurname: UILabel = {
        let label = UILabel()
        label.font = .rounded(ofSize: 50, weight: .bold)
        label.textColor = .white
        label.textAlignment = .left
        return label
    }()
    
    private let quoteLabel: UILabel = {
        let label = UILabel()
        label.text = "“"
        label.font = UIFont(name: "Arial Rounded MT Bold", size: 70)
        label.textColor = .white
        return label
    }()
    
    lazy var artistDescription: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = .rounded(ofSize: 18, weight: .light)
        label.textColor = .white
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        addSubview(imageView)
        addSubview(blurEffectView)
        
        blurEffectView.contentView.addSubview(artistName)
        blurEffectView.contentView.addSubview(artistSurname)
        blurEffectView.contentView.addSubview(quoteLabel)
        blurEffectView.contentView.addSubview(artistDescription)
        
    }
    
    private func setConstraints() {
        imageView.snp.makeConstraints { make in
            make.leading.trailing.bottom.top.equalToSuperview()
        }
        
        blurEffectView.snp.makeConstraints { make in
            make.edges.equalTo(imageView)
        }
        
        artistName.snp.makeConstraints { make in
            make.top.equalTo(blurEffectView.safeAreaLayoutGuide).inset(-40)
            make.leading.equalTo(blurEffectView.safeAreaLayoutGuide).inset(20)
        }
        
        artistSurname.snp.makeConstraints { make in
            make.top.equalTo(artistName.snp.bottom).inset(10)
            make.leading.equalTo(blurEffectView.safeAreaLayoutGuide).inset(20)
        }
        
        quoteLabel.snp.makeConstraints { make in
            make.trailing.equalTo(blurEffectView.snp.leading).inset(80)
            make.top.equalTo(artistSurname.snp.bottom).inset(-50)
        }
        
        artistDescription.snp.makeConstraints { make in
            make.top.equalTo(artistSurname.snp.bottom).inset(-80)
            make.trailing.equalTo(blurEffectView.safeAreaLayoutGuide).inset(20)
            make.width.equalTo(280)
        }
    }
    
}
