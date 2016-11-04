//
//  ViewController.swift
//  绘制图形
//
//  Created by zhangyongjun on 16/5/27.
//  Copyright © 2016年 张永俊. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let myview = MyView.init(frame:view.bounds)
        view.addSubview(myview)
        myview.backgroundColor = UIColor.white
    }


}

