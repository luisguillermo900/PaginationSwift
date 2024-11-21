import SwiftUI

struct FoodsView: View {
    @StateObject var foodVM = FoodViewModel()

    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack {
                    ForEach(foodVM.foods, id: \.self) { food in
                        NavigationLink(destination: FoodDetailView(food: food)) {
                            FoodView(food: food)
                                .onAppear {
                                    foodVM.loadMoreContentIfNeeded(currentFood: food)
                                }
                        }
                        .buttonStyle(PlainButtonStyle())  
                    }
                }
            }
            .navigationTitle("Alimentos")
        }
        .onAppear {
            foodVM.fetchFoods()  // Cargar los alimentos al aparecer la vista.
        }
    }
}
