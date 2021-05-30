//
//  LibraryAlbumsResponse.swift
//  Spotify tutorial
//
//  Created by Eryk Gasiorowski on 30/05/2021.
//

import Foundation

struct LibraryAlbumsResponse: Codable {
    let items: [SavedAlbum]
}

struct SavedAlbum: Codable {
    let added_at: String
    let album: Album
    
}
