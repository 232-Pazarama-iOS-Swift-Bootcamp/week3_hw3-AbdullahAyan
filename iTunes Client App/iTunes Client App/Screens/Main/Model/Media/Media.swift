//
//  Podcast.swift
//  iTunes Client App
//
//  Created by Pazarama iOS Bootcamp on 1.10.2022.
//

import Foundation

class Media: Codable{
    
    let context: String?
    let artistName: String?
    let trackName: String?
    let artworkNormal: URL?
    let artworkLarge: URL?
    let releaseDate: String?
    let country: String?
    
    enum CodingKeys: String, CodingKey {
        case context
        case artistName
        case trackName
        case artworkNormal = "artworkUrl100"
        case artworkLarge = "artworkUrl600"
        case releaseDate
        case country
    }
}
