//
//  LibraryPlaylistsResponse.swift
//  Spotify tutorial
//
//  Created by Eryk Gasiorowski on 25/05/2021.
//

import Foundation

struct LibraryPlaylistsResponse: Codable {
    let items: [Playlist]
    
}
