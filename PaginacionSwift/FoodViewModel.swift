import Foundation
import Combine

class FoodViewModel: ObservableObject {
    @Published var foods: [Food] = []
    private var isLoading = false
    
    // URL para consumir los datos del Firebase Realtime Database
    private let apiUrl = "https://alimentos-e03a6-default-rtdb.firebaseio.com/1.json"
    
    // Función para obtener los alimentos desde Firebase
    func fetchFoods() {
        guard !isLoading else { return }
        
        isLoading = true
        guard let url = URL(string: apiUrl) else {
            print("URL inválida")
            self.isLoading = false
            return
        }
        
        // se realiza la solicitud HTTP a Firebase
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let self = self else { return }
            
            if let error = error {
                print("Error al obtener los datos: \(error.localizedDescription)")
                DispatchQueue.main.async {
                    self.isLoading = false
                }
                return
            }
            
            guard let data = data else {
                print("No se obtuvo data.")
                DispatchQueue.main.async {
                    self.isLoading = false
                }
                return
            }
            
            // Parsear los datos JSON
            do {
                let decoder = JSONDecoder()
                let fetchedFood = try decoder.decode(Food.self, from: data)  // Decodificamos un solo objeto Food
                DispatchQueue.main.async {
                    self.foods = [fetchedFood]  // Agregamos el objeto único a un array de alimentos
                    self.isLoading = false
                }
            } catch {
                print("Error al parsear el JSON: \(error.localizedDescription)")
                DispatchQueue.main.async {
                    self.isLoading = false
                }
            }
        }.resume()
    }
    
    
    func loadMoreContentIfNeeded(currentFood food: Food) {
        
    }
}
