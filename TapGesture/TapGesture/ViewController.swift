//
//  ViewController.swift
//  TapGesture
//
//  Created by Yii on 2019/10/10.
//  Copyright © 2019 Yii. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var image: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let gesture = UITapGestureRecognizer(target: self, action: #selector(aaa))
        label.isUserInteractionEnabled = true
        label.addGestureRecognizer(gesture)
        //
        let gesture2 = UITapGestureRecognizer(target: self, action: #selector(bbb))
        image.isUserInteractionEnabled = true
        image.addGestureRecognizer(gesture2)
    }

    @objc func aaa(sender: UITapGestureRecognizer) {
        print("aaa")
    }
    
    @objc func bbb(sender: UITapGestureRecognizer) {
        print("bbb")
    }

}

