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
        NetworkManager.shared.request(fromURL: url) { (result: ResultType<Categories>) in
            switch result {
            case .success(let success):
                self.presenter?.fetchedCategories(result:success)
            case .failure(let failure):
                print("Error: \(failure.localizedDescription)")
            }
        }
    }
    
    
    func getMealsInCategory(category:String){
        guard let url = URL(string: "https://www.themealdb.com/api/json/v1/1/filter.php?c=\(category)") else {
            return
        }
        
        NetworkManager.shared.request(fromURL: url) { (result: ResultType<Meals>) in
            switch result {
            case .success(let success):
                self.presenter?.fetchedMeals(result:success)
            case .failure(let failure):
                print("Error: \(failure.localizedDescription)")
            }
        }
    }
    
}
