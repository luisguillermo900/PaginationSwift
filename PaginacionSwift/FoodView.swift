import SwiftUI

struct FoodView: View {
    var food: Food
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(food.nombre)
                    .font(.headline)
                Text(food.categoria)
                    .font(.subheadline)
            }
            Spacer()
        }
        .padding()
    }
}
