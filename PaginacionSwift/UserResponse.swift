//
//  UserResponse.swift
//  PaginacionSwift
//
//  Created by epismac on 17/10/24.
//

import Foundation

struct UserResponse: Decodable {
    let results: [User]
    let info: Info
}

struct Info: Decodable {
    let seed: String
    let results: Int
    let page: Int
}

struct User: Decodable, Hashable {
    let name: Name
    let location: Location
    let email: String
    let phone: String
    let cell: String
    let picture: Picture
}

struct Name: Decodable, Hashable {
    let title: String
    let first: String
    let last: String
}

struct Location: Decodable, Hashable {
    let street: Street
    let city: String
    let state: String
    let country: String
}

struct Street: Decodable, Hashable {
    let number: Int
    let name: String
}

struct Picture: Decodable, Hashable {
    let large: String
    let medium: String
    let thumbnail: String
}
