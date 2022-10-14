//
//  MenuViewPresenter.swift
//  Food-Delivery
//
//  Created by Shuhrat Nurov on 13/10/22.
//  
//

import Foundation
import UIKit

enum MenuSection:Int{
    case stock = 0
    case items
}

protocol MenuViewPresenterProtocol: AnyObject {
    // VIEW -> PRESENTER
    func viewDidload()
    func categoryList()->[Category]
    func getMealsInCategory(index:IndexPath)
    func numberOfRows(section:Int) -> Int
    func numberOfSections() -> Int
    func getMeal(index:Int)->Meal
    func getCategory(index:Int)->Category
}

protocol MenuViewInteractorToPresenterProtocol: AnyObject {
    // INTERACTOR -> PRESENTER
    func fetchedCategories(result:Categories)
    func fetchedMeals(result:Meals)
}

class MenuViewPresenter {
    private weak var view: MenuViewViewControllerProtocol?
    private var interactor: MenuViewInteractorProtocol
    private var router: MenuViewRouterProtocol?
    
    private let sections:[MenuSection] = [.stock, .items]
    private var categories:[Category] = []
    private var meals:[Meal] = []
    
    init(interactor: MenuViewInteractorProtocol, router: MenuViewRouterProtocol?  = nil, view: MenuViewViewControllerProtocol? = nil) {
        self.interactor = interactor
        self.router = router
        self.view = view
    }
    
    func categoryList()->[Category]{
        return categories
    }
    
    func getMealsInCategory(index:IndexPath){
        let item = getCategory(index: index.row)
        interactor.getMealsInCategory(category: item.strCategory)
    }
    
    func numberOfRows(section:Int) -> Int{
        return section == 0 ? categories.count : meals.count
    }
    
    func numberOfSections() -> Int{
        return sections.count
    }
    
    func getMeal(index:Int)->Meal{
        return meals[index]
    }
    
    func getCategory(index:Int)->Category{
        return categories[index]
    }
}

extension MenuViewPresenter: MenuViewPresenterProtocol {
    // VIEW -> PRESENTER
    func viewDidload() {
        interactor.getCategories()
    }
}


extension MenuViewPresenter: MenuViewInteractorToPresenterProtocol {
    // INTERACTOR -> PRESENTER
    func fetchedCategories(result:Categories){
        categories = result.categories
        interactor.getMealsInCategory(category: categories[0].strCategory)
    }
    
    func fetchedMeals(result:Meals){
        meals = result.meals
        view?.reloadData()
    }
}
