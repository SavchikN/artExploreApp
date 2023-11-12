//
//  ArtViewController.swift
//  artExploreApp
//
//  Created by Nikita Savchik on 12/11/2023.
//

import UIKit
import SnapKit

class ArtViewController: UIViewController {
    
    lazy var artName: UILabel = {
        let label = UILabel()
        label.font = .rounded(ofSize: 40, weight: .bold)
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    lazy var imageView: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 20
        image.clipsToBounds = true
        image.isUserInteractionEnabled = true
        return image
    }()
    
    lazy var artDescription: UITextView = {
        let label = UITextView()
        label.font = .rounded(ofSize: 25, weight: .medium)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        view.addSubview(artName)
        view.addSubview(imageView)
        view.addSubview(artDescription)
        
        setConstraints()
    }
    
    private func setConstraints() {
        artName.snp.makeConstraints { make in
            make.top.equalTo(25)
            make.leading.equalTo(15)
            make.trailing.equalTo(-15)
        }
        
        imageView.snp.makeConstraints { make in
            make.top.equalTo(artName.snp.bottom).inset(-20)
            make.centerX.equalToSuperview()
            make.height.equalTo(340)
            make.width.equalTo(340)
        }
        
        artDescription.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).inset(-20)
            make.leading.equalTo(15)
            make.trailing.equalTo(-15)
            make.bottom.equalTo(-40)
        }
    }
    
    func configure(title: String, image: String, description: String) {
        artName.text = title
        imageView.image = UIImage(named: image)
        artDescription.text = description
    }
}
