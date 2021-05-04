//
//  AllCategoriesResponse.swift
//  Spotify tutorial
//
//  Created by Eryk Gasiorowski on 03/05/2021.
//

import Foundation

struct AllCategoriesResponse: Codable {
    let categories: Categories
}

struct Categories: Codable {
    let items: [Category]
}

struct Category: Codable {
    let id: String
    let name: String
    let icons: [APIImage]
}
