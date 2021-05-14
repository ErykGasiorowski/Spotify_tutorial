//
//  SearchResult.swift
//  Spotify tutorial
//
//  Created by Eryk Gasiorowski on 05/05/2021.
//

import Foundation

enum SearchResult {
    case artist(model: Artist)
    case album(model: Album)
    case track(model: AudioTrack)
    case playlist(model: Playlist)
}
