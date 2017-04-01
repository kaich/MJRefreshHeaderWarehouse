//
//  CKCylinderReversibleHeaderViewController.swift
//  MJRefreshHeaderWarehouse
//
//  Created by mac on 17/3/15.
//  Copyright © 2017年 CocoaPods. All rights reserved.
//

import UIKit
import MJRefreshHeaderWarehouse

class CKCylinderReversibleHeaderViewController: CKBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func createTableHeader() {
        let header:CKCylinderReversibleHeader  = CKCylinderReversibleHeader.init {
           self.endRefresh()
        }
        tableView.mj_header = header
    }
    
    override func createTableFooter() {
        let footer: CKCylinderReversibleFooter = CKCylinderReversibleFooter.init {
            self.endRefresh(isHeader: false)
        }
        tableView.mj_footer = footer
    }

}
