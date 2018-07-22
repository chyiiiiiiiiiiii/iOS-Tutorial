//
//  ViewController.swift
//  UIView
//
//  Created by apple on 2018/7/22.
//  Copyright © 2018年 uni-smart. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //
        
    }
    
    /// 背景顏色和透明度
    func changeBackgroungColor(view: UIView, color: CGColor, opacity: Float) {
        let layer = view.layer
        layer.backgroundColor = color
        layer.opacity = opacity
    }
    
    /// 圓角
    func addCornerRadius(view: UIView, radius: CGFloat) {
        let layer = view.layer
        // 半徑
        layer.cornerRadius = radius
        // 如果子View的範圍超出了父View的邊界，那麼超出的部分就會被裁剪掉
        view.clipsToBounds = true
    }
    
    /// 邊框
    func addBorder(view: UIView, color: CGColor, width: CGFloat) {
        let layer = view.layer
        // 顏色
        layer.borderColor = color
        // 寬度
        layer.borderWidth = width
    }
    
    /// 陰影 ; 注意 - 如果clipsToBounds設置為YES，則陰影效果消失
    func addShadow(view: UIView, offset: CGSize, opacity: Float, radius: CGFloat, color: CGColor) {
        let layer = view.layer
        // 偏移量，XY表示圖左上角，寬度表示陰影與x的偏移量，高度表示陰影與y值的偏移量
        layer.shadowOffset = offset
        // 陰影透明度，默認為0則看不到陰影，shadowColor的透明度也必須大於0
        layer.shadowOpacity = opacity
        // 模糊計算的半徑，越大越模糊
        layer.shadowRadius = radius
        // 陰影顏色，可設置透明度等
        layer.shadowColor = color
    }
    
    /// 漸層
    func addGradient(view: UIView) {
        let layer = view.layer
        let gLayer = CAGradientLayer()
        // 漸層顏色，幾種顏色代表有幾層
        gLayer.colors = [UIColor.blue.cgColor, UIColor.red.cgColor, UIColor.lightGray.cgColor]
        // 漸層範圍
        gLayer.frame = self.view.frame
        layer.insertSublayer(gLayer, at: 0)
    }

}

