import Foundation
import Combine

class FoodViewModel: ObservableObject {
    @Published var foods: [Food] = []
    private var isLoading = false
    private let apiUrl = "https://alimentos-e03a6-default-rtdb.firebaseio.com/Foods.json"  
    
    // Función para obtener los alimentos
    func fetchFoods() {
        guard !isLoading else { return }
        
        isLoading = true
        guard let url = URL(string: apiUrl) else {
            print("URL inválida")
            self.isLoading = false
            return
        }
        
        // Realizar la solicitud HTTP para obtener los datos de Firebase
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
            
            
            do {
                let response = try JSONDecoder().decode([Food].self, from: data)
                
                DispatchQueue.main.async {
                    self.foods = response  // Almacenamos la lista de alimentos
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
}
