import SwiftUI

struct FoodsView: View {
    @StateObject var foodVM = FoodViewModel()

    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack {
                    ForEach(foodVM.foods, id: \.self) { food in
                        FoodView(food: food)
                            .onAppear {
                                foodVM.loadMoreContentIfNeeded(currentFood: food)
                            }
                    }
                }
            }
            .navigationTitle("Alimentos")
        }
        .onAppear {
            foodVM.fetchFoods()
        }
    }
}
