import Foundation
import Combine

class FoodViewModel: ObservableObject {
    @Published var foods: [Food] = []
    private var currentPage = 1
    private var canLoadMorePages = true
    private var isLoading = false
    
    func fetchFoods() {
        guard !isLoading else { return }
        
        isLoading = true
        let apiUrl = "https://alimentos-e03a6-default-rtdb.firebaseio.com/Foods/1"
        
        guard let url = URL(string: apiUrl) else { return }
        
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let data = data, error == nil else {
                DispatchQueue.main.async {
                    self?.isLoading = false
                }
                return
            }
            
            let decoder = JSONDecoder()
            do {
                let response = try decoder.decode(FoodResponse.self, from: data)
                DispatchQueue.main.async {
                    self?.foods.append(contentsOf: response.results)
                    self?.canLoadMorePages = response.results.count == 5
                    self?.isLoading = false
                }
            } catch {
                DispatchQueue.main.async {
                    self?.isLoading = false
                }
            }
        }.resume()
    }
    
    func loadMoreContentIfNeeded(currentFood food: Food) {
        guard canLoadMorePages, !isLoading, let lastFood = foods.last else {
            return
        }
        
        if food == lastFood {
            fetchFoods()
        }
    }
}
