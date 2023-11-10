//
//  ArtistData.swift
//  artExploreApp
//
//  Created by Nikita Savchik on 09/11/2023.
//

import UIKit

// MARK: - ArtistData
struct ArtistData: Codable {
    let artists: [Artist]
}

// MARK: - Artist
struct Artist: Codable {
    let name, bio, image, birthDay, surname, fullname: String
    let works: [Work]
}

// MARK: - Work
struct Work: Codable {
    let title, image, info: String
}
