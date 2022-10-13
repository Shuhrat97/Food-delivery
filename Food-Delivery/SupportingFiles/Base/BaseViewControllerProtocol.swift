//
//  BaseViewControllerProtocol.swift
//  Food-Delivery
//
//  Created by Shuhrat Nurov on 13/10/22.
//

import Foundation

protocol BaseViewControllerProtocol: AnyObject {
    func preloader(show: Bool)
    func showError(message: String?)
    func showPromt(message:String)
}


extension BaseViewControllerProtocol {
    
    func preloader(show: Bool) {
//        show ? SwiftLoader.show(animated: true) : SwiftLoader.hide()
    }
    
    func showError(message: String?) {
        if let message = message {
//            showInfoMessage(msg: message)
        }
    }
    
    func showPromt(message:String) {
//        PromptView.show(message: message)
    }
    
    func showPromtFromTop(message:String){
//        PromptView.showFromTop(message: message)
    }

}
