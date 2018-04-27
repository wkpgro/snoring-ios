//
//  ConfigurationViewController.swift
//  Snoring Companion
//
//  Created by XR on 4/26/18.
//  Copyright © 2018 XR. All rights reserved.
//

import UIKit

class ConfigurationViewController: UIViewController {

    @IBOutlet weak var m_sensitiveCtnView: UIView!
    @IBOutlet weak var m_alarmCtnView: UIView!
    
    @IBOutlet weak var m_setSoundBtn: UIButton!
    @IBOutlet weak var m_radarBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.m_sensitiveCtnView.layer.borderColor = Global.APP_MAIN_BACKGROUND.cgColor
        self.m_sensitiveCtnView.layer.borderWidth = 0.5
        
        self.m_sensitiveCtnView.layer.masksToBounds = true
        self.m_sensitiveCtnView.layer.shadowColor = UIColor.white.cgColor
        self.m_sensitiveCtnView.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        self.m_sensitiveCtnView.layer.shadowRadius = 2.0
        self.m_sensitiveCtnView.layer.shadowOpacity = 1.0
        self.m_sensitiveCtnView.layer.masksToBounds = false
        self.m_sensitiveCtnView.layer.shadowPath = UIBezierPath(roundedRect: self.m_sensitiveCtnView.bounds, cornerRadius: self.m_sensitiveCtnView.layer.cornerRadius).cgPath
        
        self.m_alarmCtnView.layer.borderColor = Global.APP_MAIN_BACKGROUND.cgColor
        self.m_alarmCtnView.layer.borderWidth = 0.5
        
        self.m_alarmCtnView.layer.masksToBounds = true
        self.m_alarmCtnView.layer.shadowColor = UIColor.white.cgColor
        self.m_alarmCtnView.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        self.m_alarmCtnView.layer.shadowRadius = 2.0
        self.m_alarmCtnView.layer.shadowOpacity = 1.0
        self.m_alarmCtnView.layer.masksToBounds = false
        self.m_alarmCtnView.layer.shadowPath = UIBezierPath(roundedRect: self.m_alarmCtnView.bounds, cornerRadius: self.m_alarmCtnView.layer.cornerRadius).cgPath
    }
   
    func setupView() {
        
        self.view.backgroundColor = Global.APP_MAIN_BACKGROUND
        self.navigationController?.isNavigationBarHidden = true
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.bounds
        gradientLayer.colors = [Global.APP_MAIN_BACKGROUND.cgColor, Global.GRADIENT_COLOR1.cgColor, Global.GRADIENT_COLOR2.cgColor, Global.GRADIENT_COLOR1.cgColor]
        gradientLayer.locations = [0.0, 0.2, 0.45, 0.9]
        self.view.layer.insertSublayer(gradientLayer, at: 0)
        
        UIManager.addNavBarItem(targetController: self, selector: #selector(onMainBtn(_:)))
        
        m_radarBtn.layer.borderWidth = 0.5
        m_radarBtn.layer.borderColor = UIColor.white.cgColor
        
        m_setSoundBtn.layer.borderWidth = 0.5
        m_setSoundBtn.layer.borderColor = UIColor.white.cgColor
    }
    
    @objc func onMainBtn(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }

}
