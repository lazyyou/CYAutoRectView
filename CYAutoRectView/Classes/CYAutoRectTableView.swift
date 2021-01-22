//
//  CYAutoRectTableView.swift
//  CYAutoRectView
//
//  Created by Podinn on 2021/1/22.
//

import UIKit

@objc
@IBDesignable
public class CYAutoRectTableView: UITableView {

    public var autoRectType: CYAutoRectType = .height
    
    @IBInspectable
    var _autoRectType: Int {
        get {
            return autoRectType.rawValue
        }
        set(type) {
            autoRectType = CYAutoRectType(rawValue: type) ?? .width
        }
    }
    
    deinit {
        self.removeObserver(self, forKeyPath: "contentSize")
    }
    
    public override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setup()
    }
    
    public override var intrinsicContentSize: CGSize {
        var width = self.frame.width
        var height = self.frame.height

        if self.autoRectType == .height {
            height = self.contentSize.height + self.contentInset.top + self.contentInset.bottom
        } else {
            width = self.contentSize.width + self.contentInset.left + self.contentInset.right
        }
        
        return CGSize(width: width, height: height)
    }
    
    func setup() -> Void {
        self.addObserver(self, forKeyPath: "contentSize", options: [.new, .old], context: nil)
    }
    
    public override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        self.invalidateIntrinsicContentSize()
    }
}
