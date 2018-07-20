//
//  ViewController.swift
//  UIApplication
//
//  Created by apple on 2018/7/19.
//  Copyright © 2018年 uni-smart. All rights reserved.
//

import UIKit

/*
 sms:0911222333
 tel:0911222333
 http://www.apple.com
 itms-apps://itunes.apple.com/app/id444934666
 */

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // 更改狀態欄的文字顏色
        UIApplication.shared.statusBarStyle = .lightContent
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //
        showAlert()
    }
    
    /// 跳出視窗
    func showAlert() {
        let alert = UIAlertController(title: "提醒", message: "應用有新版本(2.0)", preferredStyle: .alert)
        //
        let cancel = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        let ok = UIAlertAction(title: "確定", style: .default) { (action) in
            self.openWebsite()
        }
        //
        alert.addAction(cancel)
        alert.addAction(ok)
        //
        present(alert, animated: true, completion: nil)
    }
    
    //---------------------------------------------------------------
    
    /// 傳簡訊
    func sendMessage() {
        jumpToUrl(url: "sms:0911222333")
    }
    /// 打電話
    func call() {
        jumpToUrl(url: "tel:0911222333")
    }
    /// 打開網頁
    func openWebsite() {
        jumpToUrl(url: "http://www.apple.com")
    }
    /// 開啟App的商店資訊
    func gotoAppStore() {
        jumpToUrl(url: "itms-apps://itunes.apple.com/app/id444934666")
    }
    
    //---------------------------------------------------------------
    
    func jumpToUrl(url: String) {
        let urlString = url
        if let url = URL(string: urlString) {
            // iOS 10以上
            if #available(iOS 10, *) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            } else {
                // iOS 10下
                UIApplication.shared.openURL(url)
            }
        }
    }

}

