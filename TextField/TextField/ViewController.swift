//
//  ViewController.swift
//  TextField
//
//  Created by apple on 2018/7/20.
//  Copyright © 2018年 uni-smart. All rights reserved.
//

import UIKit

/*
 正規式：
    中文：[^\\u4E00-\\u9FA5\\u3105-\\u3129\\u02CA\\u02C7\\u02CB\\u02D9]
    英文：[^A-Za-z]
    數字：[^0-9]
    中文或英文：[^A-Za-z\\u4E00-\\u9FA5]
    英文或數字：[^A-Za-z0-9]
    因為或數字或下劃線：[^A-Za-z0-9_]
 */

class ViewController: UIViewController, UITextFieldDelegate   {
    
    @IBOutlet weak var tf: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // 實作協定
        tf.delegate = self
    }
    
    /// 準備開始編輯
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print("textFieldShouldBeginEditing")
        return true
    }
    /// 開始編輯
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("textFieldDidBeginEditing")
    }
    /// 準備結束編輯
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        print("textFieldShouldEndEditing")
        return true
    }
    /// 結束編輯
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("textFieldDidEndEditing")
    }
    /// 刪除內容
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        print("textFieldShouldClear")
        return true
    }
    /// 按下Return鍵
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("textFieldShouldReturn")
        // 1.關閉鍵盤
        self.view.endEditing(true)
        // 2.關閉鍵盤
        tf.resignFirstResponder()
        //
        return true
    }
    /// 內容改變的時候
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print("changed")
        // 必須確定長度，否則刪除文字會被阻擋
        if string.count > 0 {
//            return text1(range: range, input: string)
            return text2(pattern: "[^A-Za-z]", source: string)
        }
        //
        return true
    }

}

extension ViewController {
    
    /// 1.字元的ASCII比對
    func text1(range: NSRange, input: String) -> Bool {
        let length = input.count
        for i in 0 ..< length {
            let char = NSString(string: input).character(at: i)
            // 限制數字
            if char < 48 || char > 57 {
                return false
            }
            // 限制英文
            if char < 65 {
                return false
            } else if char > 90 && char < 97 {
                return false
            } else if char > 122 {
                return false
            }
            // 限制數量、長度
            if range.location > 4 {
                return false
            }
        }
        return true
    }
    
    /// 2.正規式過濾
    func text2(pattern: String, source: String) -> Bool {
        let regex =  try! NSRegularExpression(pattern: pattern, options: [])
        let result = regex.stringByReplacingMatches(in: source, options: [], range: NSMakeRange(0, source.count), withTemplate: "")
        if result.count == 0 {
            return false
        }
        return true
    }
    
}

