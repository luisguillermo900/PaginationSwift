import SwiftUI

struct FoodsView: View {
    @StateObject var foodVM = FoodViewModel()

    var body: some View {
        NavigationView {
            List(foodVM.foods, id: \.id) { food in
                NavigationLink(destination: FoodDetailView(food: food)) {
                    FoodView(food: food)  
                }
            }
            .navigationTitle("Alimentos")
            .onAppear {
                foodVM.fetchFoods()
            }
        }
    }
}
