//
//  FancyRibbonViewController.swift
//  VCRibbonView
//
//  Created by Craig Barreras on 12/22/15.
//  Copyright © 2015 Vicino. All rights reserved.
//

import UIKit

class FancyRibbonViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let ribbonView = VCFancyRibbonView(frame: CGRectMake(100, 100, 200, 200))
        view.addSubview(ribbonView)
    }
}
