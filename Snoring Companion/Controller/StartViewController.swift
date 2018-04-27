//
//  StartViewController.swift
//  Snoring Companion
//
//  Created by XR on 4/26/18.
//  Copyright © 2018 XR. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {

    @IBOutlet weak var m_txtView: UITextView!
    @IBOutlet weak var m_chargerBtn: UIButton!
    @IBOutlet weak var m_storageBtn: UIButton!
    
    var green_color = UIColor(red: CGFloat(15.0 / 255.0), green: CGFloat(250.0 / 255.0), blue: CGFloat(183.0 / 255.0), alpha: 1.0)
    var red_color = UIColor.red
    
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
        
        
        let text = "Step 1\nMake sure phone is connected to charger. \nPlease see Charger connected status at bottom of this screen.\n\nStep 2\nPlace your phone near you so that its micorphone can detect your snoring.\n Make sure your phone is placed face down and the screen will turn off automatically.\n\nStep 3\nThe Snoring Companion will wait 10 minutes from NOW for you to go to sleep to start detection and alarming."
//        self.tapRange = (text as NSString).range(of: "Terms of Services")
        let attributtedString = NSMutableAttributedString(string: text)
//        attributtedString.addAttribute(NSLinkAttributeName, value: URL(string: categon_service_team_url)!, range: self.tapRange!)
//        attributtedString.addAttribute(NSFontAttributeName, value: UIFont(name: "Avenir-Book", size: 10.0)!, range: self.tapRange!)
//        attributtedString.addAttribute(NSUnderlineStyleAttributeName, value: NSUnderlineStyle.styleSingle.rawValue, range: self.tapRange!)
        self.m_txtView.attributedText = attributtedString
        
        
        
        
    }
    
    func loadData() {
        let charging_text = "Charger\nis connected"
        let storage_text = "Storage\nspace ok"
        
        self.m_chargerBtn.tag = 101
        let charge_attributtedString = NSMutableAttributedString(string: charging_text)
        let paragraph = NSMutableParagraphStyle()
        paragraph.alignment = .center
        
//
//        CTParagraphStyleSetting settings[1] = {alignmentSetting};
//
//        size_t settingsCount = 1;
//        CTParagraphStyleRef paragraphRef = CTParagraphStyleCreate(settings, settingsCount);
//        NSDictionary *attributes = @{(__bridge id)kCTParagraphStyleAttributeName : (__bridge id)paragraphRef};
//        NSAttributedString *attributedString = [[NSAttributedString alloc] initWithString:@"Hello World" attributes:attributes];
        
        
        self.m_chargerBtn.setAttributedTitle(charge_attributtedString, for: .normal)
        self.m_chargerBtn.setTitle(charging_text, for: .normal)
        self.m_chargerBtn.backgroundColor = green_color
        
        self.m_storageBtn.tag = 101
        let storage_attributtedString = NSMutableAttributedString(string: storage_text)
        self.m_storageBtn.setAttributedTitle(storage_attributtedString, for: .normal)
        self.m_storageBtn.backgroundColor = red_color
    }
    
    @objc func onMainBtn(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}
