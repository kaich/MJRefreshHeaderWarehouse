//
//  ViewController.swift
//  MJRefreshHeaderWarehouse
//
//  Created by chengkai1853@163.com on 03/15/2017.
//  Copyright (c) 2017 chengkai1853@163.com. All rights reserved.
//

import UIKit

struct CKItem {
    var name: String?
    var vc: String?
}

class ViewController: UIViewController, UITableViewDelegate , UITableViewDataSource {

    @IBOutlet weak var tableview: UITableView!
    var datasource = [CKItem]();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        datasource.append(CKItem(name: "CKCylinderReversibleHeader", vc: "CKCylinderReversibleHeaderViewController"))

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datasource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.textLabel?.text = datasource[indexPath.row].name
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vcname = datasource[indexPath.row].vc {
            if let vcClass = NSClassFromString("MJRefreshHeaderWarehouse_Example." + vcname) as? UIViewController.Type {
                let vc = vcClass.init()
                vc.title = vcname
                navigationController?.pushViewController(vc, animated: true)
            }
        }
    }
}

