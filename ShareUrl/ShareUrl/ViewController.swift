//
//  ViewController.swift
//  ShareUrl
//
//  Created by apple on 2019/6/14.
//  Copyright © 2019 uni-smart. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // phone call
//        phoneCall("110")
        // GoogleMap
//        openGoogleMap(24.133146, 120.649106, "Costco")
//        openGoogleMapAndShowRoute(24.133146, 120.649106)
////        // Url
//        openUrl("http://www.google.com")
////        // Facebook
//        openFacebook("100000482906443", "YiiChennn")
//        // Instagram
//        openInstagram("chyiiiiiiiiiiii")
//        // Line
        openLine("@zara_taiwan")
    }

}

extension ViewController {
    
    func phoneCall(_ phoneNumber: String) {
        let schemeUrl = "tel://\(phoneNumber)"
        guard let url = URL(string: schemeUrl) else {
            return
        }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
    
    func openGoogleMap(_ lat: Double, _ lng: Double, _ title: String) {
        let schemeUrl = "comgooglemaps://?q=loc:\(lat),\(lng)(\(title))&zoom=17"
        let url = "http://maps.google.com/maps?q=loc:\(lat),\(lng)(\(title))&zoom=17"
        if UIApplication.shared.canOpenURL(URL(string: schemeUrl)!) {
            UIApplication.shared.open(URL(string: schemeUrl)!, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.open(URL(string: url)!, options: [:], completionHandler: nil)
        }
    }
    
    func openGoogleMapAndShowRoute(_ lat: Double, _ lng: Double) {
        let schemeUrl = "comgooglemaps://?saddr=&daddr=\(lat),\(lng)&directionsmode=driving"
        let url = "http://maps.google.com/maps?saddr=&daddr=\(lat),\(lng)&directionsmode=driving"
        if (UIApplication.shared.canOpenURL(URL(string: schemeUrl)!)) {
            UIApplication.shared.open(URL(string: schemeUrl)!, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.open(URL(string: url)!, options: [:], completionHandler: nil)
        }
    }
    
    
    func openUrl(_ urlString: String) {
        guard let url = URL(string: urlString) else {
            return
        }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
    
    func openFacebook(_ pageId: String, _ pageName: String) {
        let schemeUrl = "fb://profile/\(pageId)"
        let url = "https://www.facebook.com/\(pageName)"
        if UIApplication.shared.canOpenURL(URL(string: schemeUrl)!) {
            UIApplication.shared.open(URL(string: schemeUrl)!, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.open(URL(string: url)!, options: [:], completionHandler: nil)
        }
    }
    
    func openInstagram(_ userName: String) {
        let schemeUrl = "instagram://user?username=\(userName)"
        let url = "http://instagram.com/\(userName)"
        if UIApplication.shared.canOpenURL(URL(string: schemeUrl)!) {
            UIApplication.shared.open(URL(string: schemeUrl)!, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.open(URL(string: url)!, options: [:], completionHandler: nil)
        }
    }
    
    func openLine(_ userId: String) {
        let schemeUrl = "line://ti/p/\(userId)"
        let url = "https://line.me/R/ti/p/\(userId)"
        if UIApplication.shared.canOpenURL(URL(string: schemeUrl)!) {
            UIApplication.shared.open(URL(string: schemeUrl)!, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.open(URL(string: url)!, options: [:], completionHandler: nil)
        }
    }
    
}

