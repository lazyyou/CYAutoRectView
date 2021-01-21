//
//  CYAutoRectImageView.swift
//  SmartAssistant
//
//  Created by Podinn on 2021/1/21.
//

import UIKit

@IBDesignable
public class CYAutoRectImageView: UIImageView {

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

    public override func layoutSubviews() {
        super.layoutSubviews()
        
        guard let image = self.image else {
            return
        }
        
        let imageWidth = image.size.width
        let imageHeight = image.size.height
        let width = self.frame.width
        let height = self.frame.height
        
        let imageRate = ceil(imageWidth / imageHeight * 100)
        let rate = ceil(width / height * 100)
        if imageRate != rate {
            self.invalidateIntrinsicContentSize()
        }
    }
    
    public override var intrinsicContentSize: CGSize {
        guard let image = self.image else {
            return super.intrinsicContentSize
        }
        
        let imageWidth = image.size.width
        let imageHeight = image.size.height
        var width = self.frame.width
        var height = self.frame.height
        
        switch self.autoRectType {
        case .height:
            height = width / imageWidth * imageHeight
        case .width:
            width = height / imageHeight * imageWidth
        }
        return CGSize(width: width, height: height)
    }
}
