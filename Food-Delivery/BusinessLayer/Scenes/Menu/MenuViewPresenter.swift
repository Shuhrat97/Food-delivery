//
//  MenuViewPresenter.swift
//  Food-Delivery
//
//  Created by Shuhrat Nurov on 13/10/22.
//  
//

import Foundation
import UIKit

protocol MenuViewPresenterProtocol: AnyObject {
    // VIEW -> PRESENTER
    func viewDidload()
}

protocol MenuViewInteractorToPresenterProtocol: AnyObject {
    // INTERACTOR -> PRESENTER
    
}

class MenuViewPresenter {
    private weak var view: MenuViewViewControllerProtocol?
    private var interactor: MenuViewInteractorProtocol
    private var router: MenuViewRouterProtocol?
    
    init(interactor: MenuViewInteractorProtocol, router: MenuViewRouterProtocol?  = nil, view: MenuViewViewControllerProtocol? = nil) {
        self.interactor = interactor
        self.router = router
        self.view = view
    }
}

extension MenuViewPresenter: MenuViewPresenterProtocol {
    // VIEW -> PRESENTER
    func viewDidload() {
        
    }
}


extension MenuViewPresenter: MenuViewInteractorToPresenterProtocol {
    // INTERACTOR -> PRESENTER
    
}
