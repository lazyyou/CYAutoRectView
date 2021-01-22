//
//  CollectionViewController.swift
//  CYAutoRectView_Example
//
//  Created by Podinn on 2021/1/21.
//  Copyright © 2021 kylin. All rights reserved.
//

import UIKit
import CYAutoRectView

private let reuseIdentifier = "Cell"

class CollectionViewController: UIViewController, UICollectionViewDataSource {

    var count = 5;
    
    @IBOutlet weak var collectionView: CYAutoRectCollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.collectionView.contentInset = UIEdgeInsets(top: 20, left: 20, bottom: 40, right: 20)
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }

    // MARK: UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)

        cell.backgroundColor = .red
        
        return cell
    }
    
    // MARK:-
    @IBAction
    func add() -> Void {
        self.count += 1
        self.collectionView.reloadData()
    }
    
    @IBAction
    func cut() -> Void {
        self.count = max(self.count - 1, 0)
        self.collectionView.reloadData()
    }
}
