import SwiftUI

struct FoodDetailView: View {
    var food: Food  
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 15) {
                Text(food.nombre)
                    .font(.largeTitle)
                    .bold()
                
                Text("Código: \(food.codigo)")
                    .font(.title2)
                    .foregroundColor(.secondary)
                
                Text("Categoría: \(food.categoria)")
                    .font(.title3)
                    .foregroundColor(.secondary)
                
                Divider()
                
                Text("Nutrientes")
                    .font(.headline)
                    .padding(.top, 10)
                
                HStack {
                    Text("Proteína: \(food.proteina, specifier: "%.1f") g")
                    Spacer()
                    Text("Grasa: \(food.grasa, specifier: "%.1f") g")
                }
                .font(.body)
                
                HStack {
                    Text("Carbohidrato: \(food.carbohidrato, specifier: "%.1f") g")
                    Spacer()
                    Text("Energía: \(food.energia, specifier: "%.1f") kcal")
                }
                .font(.body)
            }
            .padding()
        }
        .navigationTitle("Detalles del Alimento")
        .navigationBarTitleDisplayMode(.inline)
    }
}
