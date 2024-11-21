import Foundation

struct Food: Decodable, Hashable {
    let codigo: Int
    let nombre: String
    let categoria: String
    let proteina: Double
    let grasa: Double
    let carbohidrato: Double
    let energia: Double
    
    // Mapeo de las claves del JSON
    enum CodingKeys: String, CodingKey {
        case codigo = "CODIGO"
        case nombre = "NOMBRE"
        case categoria = "CATEGORIA"
        case proteina = "PROTEINA"
        case grasa = "GRASA"
        case carbohidrato = "CARBOHIDRATO"
        case energia = "ENERGIA"
    }
}

struct Foods: Decodable, Hashable {
    let Food: Food
}

