//
//  TableViewController.swift
//  CYAutoRectView_Example
//
//  Created by Podinn on 2021/1/22.
//  Copyright © 2021 kylin. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class TableViewController: UIViewController, UITableViewDataSource {

    var count = 5;

    @IBOutlet weak var tableView: CYAutoRectTableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
        
        cell.backgroundColor = .red
        
        return cell
    }
    
    // MARK:-
    @IBAction
    func add() -> Void {
        self.count += 1
        self.tableView.reloadData()
    }
    
    @IBAction
    func cut() -> Void {
        self.count = max(self.count - 1, 0)
        self.tableView.reloadData()
    }
}
