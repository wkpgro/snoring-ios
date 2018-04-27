//
//  HomeViewController.swift
//  Snoring Companion
//
//  Created by XR on 4/26/18.
//  Copyright © 2018 XR. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    
    static let border_color = UIColor(red: CGFloat(244.0 / 255.0), green: CGFloat(241.0 / 255.0), blue: CGFloat(250.0 / 255.0), alpha: 1.0)
    
    
    @IBOutlet weak var m_btnFreeVersion: UIButton!
    @IBOutlet weak var m_startBtnCtner: UIVisualEffectView!
    @IBOutlet weak var m_cfgBtnCtner: UIVisualEffectView!
    @IBOutlet weak var m_rptBtnCtner: UIVisualEffectView!
    @IBOutlet weak var m_privacyBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.setupView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func setupView() {
        
        self.view.backgroundColor = Global.APP_MAIN_BACKGROUND
        self.navigationController?.isNavigationBarHidden = true
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.bounds
        gradientLayer.colors = [Global.APP_MAIN_BACKGROUND.cgColor, Global.GRADIENT_COLOR1.cgColor, Global.GRADIENT_COLOR2.cgColor, Global.GRADIENT_COLOR1.cgColor]
        gradientLayer.locations = [0.0, 0.2, 0.45, 0.9]
        self.view.layer.insertSublayer(gradientLayer, at: 0)
        
        self.m_startBtnCtner.layer.borderColor = UIColor.white.cgColor
        self.m_startBtnCtner.layer.borderWidth = 1
        
        self.m_rptBtnCtner.layer.borderColor = UIColor.white.cgColor
        self.m_rptBtnCtner.layer.borderWidth = 1
        
        self.m_cfgBtnCtner.layer.borderColor = UIColor.white.cgColor
        self.m_cfgBtnCtner.layer.borderWidth = 1
        
        
        var text = self.m_privacyBtn.title(for: .normal)
        if TextUtils.isEmpty(text) {
            text = "Manual & Terms and Conditions"
        }
        
        let text_range = NSRange(location: 0, length: text!.count)
        let attributtedString = NSMutableAttributedString(string: text!)
        attributtedString.addAttribute(NSAttributedStringKey.font, value: UIFont.systemFont(ofSize: 15.0), range: text_range)
        attributtedString.addAttribute(NSAttributedStringKey.foregroundColor, value: Global.BTN_COLOR, range: text_range)
        attributtedString.addAttribute(NSAttributedStringKey.underlineStyle, value: NSUnderlineStyle.styleSingle.rawValue, range: text_range)
        attributtedString.addAttribute(NSAttributedStringKey.underlineColor, value: Global.BTN_COLOR, range: text_range)
        self.m_privacyBtn.setAttributedTitle(attributtedString, for: .normal)
        self.m_privacyBtn.setAttributedTitle(attributtedString, for: .selected)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
