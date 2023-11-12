//
//  ViewController.swift
//  artExploreApp
//
//  Created by Nikita Savchik on 08/11/2023.
//

import UIKit

class MainViewController: UIViewController {
    
    private var allArtist: [Artist] = []
    private var filteredArtist: [Artist] = []
    
    private lazy var searchController: UISearchController = {
        let controller = UISearchController(searchResultsController: nil)
        controller.searchResultsUpdater = self
        controller.obscuresBackgroundDuringPresentation = false
        controller.hidesNavigationBarDuringPresentation = false
        controller.searchBar.placeholder = "Search:"
        return controller
    }()
    
    private let collectionView: UICollectionView = {
        let collectionViewFlowLayout = UICollectionViewFlowLayout()
        collectionViewFlowLayout.scrollDirection = .vertical
        collectionViewFlowLayout.minimumLineSpacing = 15
        
        let collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: collectionViewFlowLayout
        )
        collectionView.register(ArtistCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.showsVerticalScrollIndicator = false
        collectionView.decelerationRate = .fast
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        uploadData()
        setupUI()
        setupNavBar()
        setConstraints()
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        collectionView.delegate = self
        collectionView.dataSource = self
        self.definesPresentationContext = true
        
        setupSubviews(collectionView)
    }

    private func setupNavBar() {
        title = "ArtExplore"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.searchController = searchController
    }
    
    private func setupSubviews(_ subview: UIView...) {
        subview.forEach { subview in
            view.addSubview(subview)
        }
    }
    
    private func uploadData() {
        let data = Bundle.main.decode(ArtistData.self, from: "artist.json")
        self.allArtist.append(contentsOf: data.artists)
        self.filteredArtist = allArtist
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 17),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -17),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10)
        ])
    }
}

extension MainViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedArtist = filteredArtist[indexPath.row]
        let detailsVC = DetailsViewController(artist: selectedArtist)
        detailsVC.configure(name: selectedArtist.name, surname: selectedArtist.surname, image: selectedArtist.image, description: selectedArtist.bio)
        navigationController?.pushViewController(detailsVC, animated: true)
        print("didSelectItemAt method was call")
    }
}

extension MainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        filteredArtist.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? ArtistCollectionViewCell else { return UICollectionViewCell() }
        cell.configure(title: filteredArtist[indexPath.row].fullname, image: filteredArtist[indexPath.row].image, description: filteredArtist[indexPath.row].birthDay)
        return cell
    }
}

extension MainViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(
            width: 350,
            height: 600
        )
    }
}

extension MainViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchText = searchController.searchBar.text else { return }
        if searchText.isEmpty {
            filteredArtist = allArtist
        } else {
            filteredArtist = allArtist.filter { $0.name.lowercased().contains(searchText.lowercased()) }
        }
        collectionView.reloadData()
    }
}
