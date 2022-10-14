//
//  MenuViewInteractor.swift
//  Food-Delivery
//
//  Created by Shuhrat Nurov on 13/10/22.
//  
//

import Foundation

protocol MenuViewInteractorProtocol: AnyObject {
    func getCategories()
    func getMealsInCategory(category:String)
}

class MenuViewInteractor: MenuViewInteractorProtocol {
    weak var presenter: MenuViewInteractorToPresenterProtocol?
    func getCategories(){
        guard let url = URL(string: "https://www.themealdb.com/api/json/v1/1/categories.php") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            guard let data = data else { return }
            let decoder = JSONDecoder()
            do {
                let model = try decoder.decode(Categories.self, from: data)
                DispatchQueue.main.async {
                    self.presenter?.fetchedCategories(result:model)
                }
            } catch {
                print("Error: \(error)")
            }
            
            
        }

        task.resume()
    }
    
    
    func getMealsInCategory(category:String){
        guard let url = URL(string: "https://www.themealdb.com/api/json/v1/1/filter.php?c=\(category)") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            guard let data = data else { return }
            let decoder = JSONDecoder()
            do {
                let model = try decoder.decode(Meals.self, from: data)
                DispatchQueue.main.async {
                    self.presenter?.fetchedMeals(result:model)
                }
            } catch {
                print("Error: \(error)")
            }
            
            
        }

        task.resume()
    }
    
}
