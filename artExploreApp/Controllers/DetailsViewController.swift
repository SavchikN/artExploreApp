//
//  DetailsViewController.swift
//  artExploreApp
//
//  Created by Nikita Savchik on 09/11/2023.
//

import UIKit
import SnapKit

class DetailsViewController: UIViewController {
    
    private let artist: Artist
    
    private let blurEffectView: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: .dark)
        let view = UIVisualEffectView(effect: blurEffect)
        return view
    }()
    
    private lazy var imageView: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 20
        image.image = UIImage(named: artist.image)
        image.contentMode = .scaleToFill
        image.backgroundColor = .systemGray
        return image
    }()
    
    private lazy var artistName: UILabel = {
        let label = UILabel()
        label.font = .rounded(ofSize: 30, weight: .regular)
        label.textColor = .white
        label.textAlignment = .left
        label.text = artist.name
        return label
    }()
    
    private lazy var artistSurname: UILabel = {
        let label = UILabel()
        label.font = .rounded(ofSize: 50, weight: .bold)
        label.textColor = .white
        label.textAlignment = .left
        label.text = artist.surname
        return label
    }()
    
    private let quoteLabel: UILabel = {
        let label = UILabel()
        label.text = "“"
        label.font = UIFont(name: "Arial Rounded MT Bold", size: 70)
        label.textColor = .white
        return label
    }()
    
    private lazy var artistDescription: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = .rounded(ofSize: 18, weight: .light)
        label.text = artist.bio
        label.textColor = .white
        return label
    }()
    
    private let worksView = WorksView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setConstraints()
    }
    
    init(artist: Artist) {
        self.artist = artist
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(title: String, image: String, description: String) {
        imageView.image = UIImage(named: image)
        artistDescription.text = description
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        navigationController?.navigationBar.tintColor = .white
        
        setupSubviews(
            imageView,
            blurEffectView,
            worksView
        )
        
        blurEffectView.contentView.addSubview(artistName)
        blurEffectView.contentView.addSubview(artistSurname)
        blurEffectView.contentView.addSubview(quoteLabel)
        blurEffectView.contentView.addSubview(artistDescription)
    }
    
    private func setupSubviews(_ subview: UIView...) {
        subview.forEach { subview in
            view.addSubview(subview)
        }
    }
    
    private func setConstraints() {
        imageView.snp.makeConstraints { make in
            make.leading.top.trailing.equalToSuperview()
            make.height.equalTo(530)
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
        
        worksView.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).inset(-10)
            make.leading.equalTo(view.snp.leading).inset(25)
        }
    }
}
