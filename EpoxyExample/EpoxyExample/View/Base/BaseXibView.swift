//
//  BaseXibView.swift
//  VNShop
//
//  Created by Le Vu Huy on 9/26/19.
//  Copyright © 2019 Teko. All rights reserved.
//

import UIKit

public class BaseXibView: UIView {
    var contentView: UIView!
    
    init() {
        super.init(frame: .zero)
        commonInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() {
        contentView = loadViewFromNib()
        contentView.frame = bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        contentView.translatesAutoresizingMaskIntoConstraints = true
        addSubview(contentView)
        backgroundColor = .clear
        
        fillColor()
        fillLocalizedString()
    }
    
    private func loadViewFromNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
        let nibView = nib.instantiate(withOwner: self, options: nil).first as! UIView
        return nibView
    }
    
    override open func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        commonInit()
        invalidateIntrinsicContentSize()
    }
}

extension BaseXibView: ViewDecorable {
    @objc func fillColor() {
        
    }
    
    @objc func fillLocalizedString() {
        
    }
}
