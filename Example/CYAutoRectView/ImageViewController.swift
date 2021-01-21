//
//  ImageViewController.swift
//  CYAutoRectView_Example
//
//  Created by Podinn on 2021/1/21.
//  Copyright © 2021 kylin. All rights reserved.
//

import UIKit
import CYAutoRectView

class ImageViewController: UIViewController {

    // 不固定
    @IBOutlet weak var imageView0: CYAutoRectImageView!
    // 固定宽度，视图高度等比缩放
    @IBOutlet weak var imageView1: CYAutoRectImageView!
    // 固定高度，视图宽度等比缩放
    @IBOutlet weak var imageView2: CYAutoRectImageView!
    // 固定高度、宽度，视图宽高不变
    @IBOutlet weak var imageView3: CYAutoRectImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

    }
}
