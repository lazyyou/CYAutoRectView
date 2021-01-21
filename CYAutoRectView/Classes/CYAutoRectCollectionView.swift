//
//  CYAutoRectCollectionView.swift
//  CYAutoRectView
//
//  Created by Podinn on 2021/1/21.
//

import UIKit

@IBDesignable
public class CYAutoRectCollectionView: UICollectionView {

    @objc
    public enum AutoRectType: Int {
        case width = 0
        case height = 1
    }
    
    public var autoRectType: AutoRectType = .width
    
    @IBInspectable
    var _autoRectType: Int {
        get {
            return autoRectType.rawValue
        }
        set(type) {
            autoRectType = AutoRectType(rawValue: type) ?? .width
        }
    }
    
    deinit {
        self.removeObserver(self, forKeyPath: "contentSize")
    }
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setup()
    }
    
    public override var intrinsicContentSize: CGSize {
        if self.autoRectType == .height {
            let width = self.frame.width
            let height = self.contentSize.height + self.contentInset.top + self.contentInset.bottom
            return CGSize(width: width, height: height)
        } else {
            let width = self.contentSize.width + self.contentInset.left + self.contentInset.right
            let height = self.frame.height
            return CGSize(width: width, height: height)
        }
    }
    
    func setup() -> Void {
        self.addObserver(self, forKeyPath: "contentSize", options: [.new, .old], context: nil)
    }
    
    public override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        self.invalidateIntrinsicContentSize()
    }
}
