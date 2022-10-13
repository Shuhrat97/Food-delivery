//
//  MenuViewInteractor.swift
//  Food-Delivery
//
//  Created by Shuhrat Nurov on 13/10/22.
//  
//

import Foundation

protocol MenuViewInteractorProtocol: AnyObject {
    
}

class MenuViewInteractor: MenuViewInteractorProtocol {
    weak var presenter: MenuViewInteractorToPresenterProtocol?
    
}
