//
//  StartViewController.swift
//  Snoring Companion
//
//  Created by XR on 4/26/18.
//  Copyright © 2018 XR. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {

//    @IBOutlet weak var m_txtView: UITextView!
    @IBOutlet weak var m_chargerLbl: UILabel!
    @IBOutlet weak var m_storageLbl: UILabel!
    @IBOutlet weak var m_animationImgView: UIImageView!
    @IBOutlet weak var m_gotITBtn: UIButton!
    @IBOutlet weak var m_pageCtrl: UIPageControl!
    
    @IBOutlet weak var m_blurView: UIVisualEffectView!
    @IBOutlet weak var m_scrollView: UIScrollView!
    
    var green_color = UIColor(red: CGFloat(15.0 / 255.0), green: CGFloat(250.0 / 255.0), blue: CGFloat(183.0 / 255.0), alpha: 1.0)
    var red_color = UIColor(red: CGFloat(255.0 / 255.0), green: CGFloat(34.0 / 255.0), blue: CGFloat(68.0 / 255.0), alpha: 1.0)
    
    var is_charging = true
    var is_enough = false
    
    var is_skip = false
    
    var animation_image = UIImage(named: "white-not-charing.png")
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.setupView()
        self.loadData()
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
        
        UIManager.addNavBarItem(targetController: self, selector: #selector(onMainBtn(_:)))
    }
    
    func loadData() {
        var charging_text = "Charger is Connected"
        var storage_text = "Storage space OK"
        
        self.m_storageLbl.layer.borderColor = UIColor.white.cgColor
        self.m_chargerLbl.layer.borderColor = UIColor.white.cgColor
        self.m_storageLbl.layer.borderWidth = 0.5
        self.m_chargerLbl.layer.borderWidth = 0.5
        
        if is_enough == false {
            storage_text = "Not enough Storage space"
            self.m_storageLbl.text = storage_text
            self.m_storageLbl.backgroundColor = red_color
            animation_image = UIImage(named: "white-not-storage.png")
        } else {
            self.m_storageLbl.text = storage_text
            self.m_storageLbl.backgroundColor = green_color
        }
        
        if is_charging == false {
            charging_text = "Changer not Connected"
            self.m_chargerLbl.text = charging_text
            self.m_chargerLbl.backgroundColor = red_color
            animation_image = UIImage(named: "white-not-charging.png")
        } else {
            self.m_chargerLbl.text = charging_text
            self.m_chargerLbl.backgroundColor = green_color
        }
        
        self.m_animationImgView.image = animation_image
        
        if self.is_skip == false {
            self.m_gotITBtn.layer.borderColor = UIColor.white.cgColor
            self.m_gotITBtn.layer.borderWidth = 0.5
        }
        else {
            self.removeGotItViews()
        }
    }
    
    @objc func onMainBtn(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func onGotIt(_ sender: Any) {
        self.removeGotItViews()
    }
    
    func removeGotItViews() {
        self.m_blurView.removeFromSuperview()
        self.m_scrollView.removeFromSuperview()
        self.m_pageCtrl.removeFromSuperview()
    }
    
}

extension StartViewController: UIScrollViewDelegate {
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let index = round(scrollView.contentOffset.x / scrollView.frame.width)
        self.m_pageCtrl.currentPage = Int(exactly: index) ?? 0
    }
}
