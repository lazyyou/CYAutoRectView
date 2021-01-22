//
//  SAWidthImageView.swift
//  SmartAssistant
//
//  Created by Podinn on 2021/1/21.
//

import UIKit

@objc
@IBDesignable
public class CYAutoRectTextView: UITextView {

    deinit {
        self.removeObserver(self, forKeyPath: "contentSize")
    }
    
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setup()
    }
    
    public override var intrinsicContentSize: CGSize {
        let width = self.frame.width
        let height = self.contentSize.height + self.contentInset.top + self.contentInset.bottom
        return CGSize(width: width, height: height)
    }
    
    func setup() -> Void {
        self.addObserver(self, forKeyPath: "contentSize", options: [.new, .old], context: nil)
    }
    
    public override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        self.invalidateIntrinsicContentSize()
    }
}
