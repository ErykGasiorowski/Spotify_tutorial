//
//  SettingsModels.swift
//  Spotify tutorial
//
//  Created by Eryk Gasiorowski on 24/03/2021.
//

import Foundation

struct Section {
    let title: String
    let options: [Option]
}

struct Option {
    let title: String
    let handler: () -> Void
}
