import SwiftUI

struct FoodView: View {
    var food: Food
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(food.nombre)
                .font(.headline)
                .foregroundColor(.primary)
            
            HStack {
                Text("Categoría: \(food.categoria)")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                Spacer()
                Text("Código: \(food.codigo)")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            
            HStack {
                Text("Proteína: \(food.proteina, specifier: "%.1f") g")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                Spacer()
                Text("Grasa: \(food.grasa, specifier: "%.1f") g")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            
            HStack {
                Text("Carbohidrato: \(food.carbohidrato, specifier: "%.1f") g")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                Spacer()
                Text("Energía: \(food.energia, specifier: "%.1f") kcal")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
        }
        .padding()
    }
}
