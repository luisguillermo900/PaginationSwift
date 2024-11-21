import Foundation


struct Food: Decodable, Identifiable, Hashable {
    let id = UUID()
    let codigo: Int
    let nombre: String
    let categoria: String
    let proteina: Double
    let grasa: Double
    let carbohidrato: Double
    let energia: Double
    
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
