//
//  MenuViewViewController.swift
//  Food-Delivery
//
//  Created by Shuhrat Nurov on 13/10/22.
//  
//

import UIKit

protocol MenuViewViewControllerProtocol: BaseViewControllerProtocol {
    
}

class MenuViewViewController: BaseViewController {
    var presenter: MenuViewPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidload()
        // Do any additional setup after loading the view.
    }
}


extension MenuViewViewController: MenuViewViewControllerProtocol {
    
}
