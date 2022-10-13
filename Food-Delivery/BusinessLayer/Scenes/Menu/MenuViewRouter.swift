//
//  MenuViewRouter.swift
//  Food-Delivery
//
//  Created by Shuhrat Nurov on 13/10/22.
//  
//

import UIKit

protocol MenuViewRouterProtocol: BaseRouterProtocol {
    
}

class MenuViewRouter {
    private weak var viewController: UIViewController?
    
    static func createModule() -> UIViewController {
        let vc = MenuViewViewController()
        let interactor = MenuViewInteractor()
        let router = MenuViewRouter()
        let presenter = MenuViewPresenter(interactor: interactor, router: router, view: vc)
        
        vc.presenter = presenter
        interactor.presenter = presenter
        router.viewController = vc
        
        return vc
    }
}

extension MenuViewRouter: MenuViewRouterProtocol {
    //PRSENTRER to ROUTER
    
}

