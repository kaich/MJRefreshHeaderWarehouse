//
//  CKBaseViewController.swift
//  MJRefreshHeaderWarehouse
//
//  Created by mac on 17/3/15.
//  Copyright © 2017年 CocoaPods. All rights reserved.
//

import UIKit
import MJRefreshHeaderWarehouse

class CKBaseViewController: UIViewController,UITableViewDataSource {
    var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView = UITableView(frame: view.bounds, style: .plain);
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        self.view.addSubview(tableView)

        let hconstraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[tableView]-0-|", options: .alignAllFirstBaseline, metrics: nil, views: ["tableView":tableView])
        let vconstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[tableView]-0-|", options: .alignAllFirstBaseline, metrics: nil, views: ["tableView":tableView])
        self.view.addConstraints(hconstraints + vconstraints)
        
        createTableHeader()
        createTableFooter()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func createTableHeader() {
        
    }
    
    func createTableFooter() {
        
    }
    
    func endRefresh(isHeader: Bool = true) {
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(3)) { 
            if isHeader == false {
                self.tableView.mj_footer.endRefreshingWithNoMoreData()
            }
            else {
                self.tableView.mj_header.endRefreshing()
                self.tableView.mj_footer.resetNoMoreData()
            }
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 40
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell.init(style: .default, reuseIdentifier: nil)
        cell.textLabel?.text = "the \( indexPath.row)th row"
        return cell
    }

}
