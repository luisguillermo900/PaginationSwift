//
//  UserResponse.swift
//  PaginacionSwift
//
//  Created by epismac on 17/10/24.
//

import Foundation

struct FoodResponse: Decodable {
    let results: [Food]
}

struct Food: Decodable, Hashable {
    let codigo: Int
    let nombre: String
    let categoria: String
    let proteina: Double
    let grasa: Double
    let carbohidrato: Double
    let energia: Double
}