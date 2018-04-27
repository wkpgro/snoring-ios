//
//  UIManager.swift
//  Snoring Companion
//
//  Created by XR on 4/26/18.
//  Copyright © 2018 XR. All rights reserved.
//

import UIKit

class UIManager: NSObject {
    
    public static func addNavBarItem(targetController: UIViewController,  selector: Selector, title: String = "") {
        let btn = UIButton(frame: CGRect(x: 8, y: 14, width: 80, height: 40))
        var text = title
        if TextUtils.isEmpty(title) {
            text = "Main"
        }
        btn.setTitle(text, for: .normal)
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.backgroundColor = UIColor.clear
        btn.contentMode = .left
        btn.addTarget(targetController, action: selector, for: .touchUpInside)
        
        targetController.view.addSubview(btn)
    }
    
}
