//
//  BaseViewController.swift
//  Food-Delivery
//
//  Created by Shuhrat Nurov on 13/10/22.
//

import UIKit

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DLog("viewDidLoad \(self)")
    }
    
    deinit {
        DLog("deinit \(self)")
    }
}

func DLog(_ items: Any..., separator: String = " ", terminator: String = "\n") -> Void {
    #if DEBUG
    Swift.print(items, separator: separator, terminator: terminator)
    #else
    //not log
    #endif
}
