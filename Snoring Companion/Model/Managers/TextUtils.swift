//
//  TextUtils.swift
//  Snoring Companion
//
//  Created by XR on 4/26/18.
//  Copyright © 2018 XR. All rights reserved.
//

import UIKit

class TextUtils: NSObject {

    static func isEmpty(_ text: String?) -> Bool {
        var rslt = true
        if text == nil {
            return rslt
        }
        
        if text?.count == 0 {
            return rslt
        }
        
        rslt = false
        
        return rslt
    }
    
    func stringFromDate(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM-dd, yyyy HH:mm a"
        let dateString = dateFormatter.string(from: date)
        
        return dateString
    }
    
    func dateFromString(_ date_str: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
        dateFormatter.dateFormat = "MMM-dd, yyyy HH:mm a"
        let date = dateFormatter.date(from: date_str)!
        
        return date
    }
    
//    func getTextHeight(_ text: String, fontName: String, fontSize: CGFloat) -> CGFloat {
//        //        let attributes = [NSAttributedStringKey.font: UIFont(name: fontName, size: fontSize)!]
//        let attributes = [NSFontAttributeName: UIFont(name: fontName, size: fontSize)!]
//        let size = (text as NSString).size(attributes: attributes)
//
//        return size.height
//    }
//
//    static func heightForView(text:String, font:UIFont, width:CGFloat) -> CGFloat{
//        let label:UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: (width - 8), height: CGFloat.greatestFiniteMagnitude))
//        label.numberOfLines = 0
//        label.lineBreakMode = NSLineBreakMode.byWordWrapping
//        label.font = font
//        label.text = text
//        label.sizeToFit()
//
//        return label.frame.height
//    }
//
//    static func stringFromString(_ date_str: String) -> String {
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
//        let date = dateFormatter.date(from: date_str) ?? Date()
//
//        dateFormatter.dateFormat = "dd MMM, yyyy HH:mm a"
//        let dateString = dateFormatter.string(from: date)
//
//        return dateString
//    }
}
