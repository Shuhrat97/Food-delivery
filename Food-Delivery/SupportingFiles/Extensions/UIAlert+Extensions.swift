//
//  UIAlert+Extensions.swift
//
//  Created by Shuhrat Nurov on 13/09/22.
//

import UIKit


let kAlertCancelButtonIndex: Int = -2
let kAlertDestructiveButtonIndex: Int = -1
let kAlertFirstDefaultButtonIndex: Int = 0
let kAlertFirstHiglitedButtonIndex: Int = 1000

extension UIAlertAction {
    
    @objc convenience init(highlited title: String?, handler: ((UIAlertAction) -> Void)?) {
        self.init(title: title, style: .default, handler: handler)
        makeHighlitedAction()
    }
    
    func makeHighlitedAction() {
        setValue(UIColor.systemBlue, forKey: "titleTextColor")
    }
    
}
