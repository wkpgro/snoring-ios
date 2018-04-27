//
//  HistoryViewController.swift
//  Snoring Companion
//
//  Created by XR on 4/26/18.
//  Copyright © 2018 XR. All rights reserved.
//

import UIKit

class HistoryViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupView()
    }
    
    func setupView() {
        
        self.view.backgroundColor = Global.APP_MAIN_BACKGROUND
        self.navigationController?.isNavigationBarHidden = true
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.bounds
        gradientLayer.colors = [Global.APP_MAIN_BACKGROUND.cgColor, Global.GRADIENT_COLOR1.cgColor, Global.GRADIENT_COLOR2.cgColor, Global.GRADIENT_COLOR1.cgColor]
        gradientLayer.locations = [0.0, 0.2, 0.45, 0.9]
        self.view.layer.insertSublayer(gradientLayer, at: 0)
        
        UIManager.addNavBarItem(targetController: self, selector: #selector(onReportBtn(_:)), title: "Report")        
    }
    
    @objc func onReportBtn(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }

}
