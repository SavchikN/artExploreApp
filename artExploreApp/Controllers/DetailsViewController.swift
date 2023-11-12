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

    private let imageView = ImageView()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Author's works"
        label.font = .rounded(ofSize: 40, weight: .medium)
        label.textColor = .black
        return label
    }()
    
    private let collectionView: UICollectionView = {
        let collectionViewFlowLayout = UICollectionViewFlowLayout()
        collectionViewFlowLayout.scrollDirection = .horizontal
        collectionViewFlowLayout.minimumLineSpacing = 30
        
        let collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: collectionViewFlowLayout
        )
        collectionView.register(ArtistWorkCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.decelerationRate = .fast
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
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
    
    func configure(name: String, surname: String, image: String, description: String) {
        imageView.artistName.text = name
        imageView.artistSurname.text = surname
        imageView.imageView.image = UIImage(named: image)
        imageView.artistDescription.text = description
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        navigationController?.navigationBar.tintColor = .white
        
        setupSubviews(
            imageView,
            titleLabel,
            collectionView
        )
        
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    private func setupSubviews(_ subview: UIView...) {
        subview.forEach { subview in
            view.addSubview(subview)
        }
    }
    
    private func setConstraints() {
        imageView.snp.makeConstraints { make in
            make.leading.trailing.top.equalToSuperview()
            make.height.equalTo(530)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).inset(-10)
            make.leading.equalTo(view.snp.leading).inset(25)
        }
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).inset(-10)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(10)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
}

extension DetailsViewController: UICollectionViewDelegate {
    
}

extension DetailsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        artist.works.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? ArtistWorkCell else { return UICollectionViewCell() }

        cell.configure(title: artist.works[indexPath.row].title, image: artist.works[indexPath.row].image)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let artVC = ArtViewController()
        let selectedArtist = artist.works[indexPath.row]
        artVC.configure(
            title: selectedArtist.title,
            image: selectedArtist.image,
            description: selectedArtist.info
        )
        
        present(artVC, animated: true)
    }
}

extension DetailsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(
            width: 200,
            height: 210
        )
    }
}
