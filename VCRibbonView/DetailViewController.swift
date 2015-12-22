//
//  DetailViewController.swift
//  VCRibbonView
//
//  Created by Craig Barreras on 12/21/15.
//  Copyright © 2015 Vicino. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var ribbonView: VCRibbonView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let ribbonView = VCRibbonView(frame: CGRectMake(100, 100, 200, 200))
        view.addSubview(ribbonView)
    }
}

