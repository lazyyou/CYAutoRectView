//
//  ViewController.swift
//  CYAutoRectView
//
//  Created by 747654832@qq.com on 01/21/2021.
//  Copyright (c) 2021 747654832@qq.com. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "自动缩放视图"
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        switch indexPath.row {
        case 0:
            cell.textLabel?.text = "CYAutoRectCollectionView"
        case 1:
            cell.textLabel?.text = "CYAutoRectTableView"
        case 2:
            cell.textLabel?.text = "CYAutoRectImageView"
        default:
            cell.textLabel?.text = "CYAutoRectTextView"
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            let nextVC = CollectionViewController()
            self.navigationController?.pushViewController(nextVC, animated: true)
        case 1:
            let nextVC = TableViewController()
            self.navigationController?.pushViewController(nextVC, animated: true)
        case 2:
            let nextVC = ImageViewController()
            self.navigationController?.pushViewController(nextVC, animated: true)
        default:
            let nextVC = TextViewController()
            self.navigationController?.pushViewController(nextVC, animated: true)
        }
    }
}
