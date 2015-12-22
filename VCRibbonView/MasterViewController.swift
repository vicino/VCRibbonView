//
//  MasterViewController.swift
//  VCRibbonView
//
//  Created by Craig Barreras on 12/21/15.
//  Copyright © 2015 Vicino. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.clearsSelectionOnViewWillAppear = true
    }
}

