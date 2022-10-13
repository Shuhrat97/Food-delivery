//
//  BaseRouterProtocol.swift
//  Food-Delivery
//
//  Created by Shuhrat Nurov on 13/10/22.
//

import UIKit

protocol BaseRouterProtocol: AnyObject {
    func dismiss(viewCtrl: UIViewController?, animated: Bool, completion: (() -> Void)?)
    func pop(viewCtrl: UIViewController?, animated: Bool, completion: (() -> Void)?)
    func close(viewCtrl: UIViewController?, animated: Bool, completion: (() -> Void)?)
    func showAlert(viewCtrl: UIViewController?, title: String?, message: String?, okTitle: String?, cancelTitle: String?, completion: ((_ isCancel: Bool) -> Void)?)
}

extension BaseRouterProtocol {
    
    func dismiss(viewCtrl: UIViewController?, animated: Bool, completion: (() -> Void)?) {
        viewCtrl?.dismiss(animated: animated, completion: completion)
    }
    
    func pop(viewCtrl: UIViewController?, animated: Bool, completion: (() -> Void)?) {
        viewCtrl?.navigationController?.popViewController(animated: animated, completion: {
            completion?()
        })
    }
    
    func close(viewCtrl: UIViewController?, animated: Bool, completion: (() -> Void)?) {
        if viewCtrl?.navigationController == nil || viewCtrl?.navigationController?.viewControllers.count == 1 {
            dismiss(viewCtrl: viewCtrl, animated: animated, completion: completion)
        } else {
            pop(viewCtrl: viewCtrl, animated: animated, completion: completion)
        }
    }
    
    func showAlert(viewCtrl: UIViewController?, title:String?, message: String?, okTitle: String?, cancelTitle: String?, completion: ((_ isCancel: Bool) -> Void)?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        if let okTitle = okTitle {
            alert.addAction(.init(highlited: okTitle, handler: { (action) in
                completion?(true)
            }))
        }
        
        if let cancelTitle = cancelTitle {
            alert.addAction(.init(highlited: cancelTitle, handler: { (action) in
                completion?(false)
            }))
        }
        viewCtrl?.present(alert, animated: true, completion: nil)
    }
    
}
