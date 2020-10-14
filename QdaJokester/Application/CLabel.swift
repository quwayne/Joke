//
//  CLabel.swift
//  QdaJokester
//
//  Created by Q B on 9/29/20.
//  Copyright © 2020 Quwayne. All rights reserved.
//

import UIKit


class CLabel: UILabel {
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        configure()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    convenience init(textColor: UIColor, fontSize: CGFloat, textAlignment: NSTextAlignment) {
        self.init(frame: .zero)
        self.textColor = textColor
        self.font.withSize(fontSize)
        self.textAlignment = textAlignment
    }
    
    
    private func configure() {
        font = UIFont.preferredFont(forTextStyle: .body)
        adjustsFontForContentSizeCategory = true
        adjustsFontSizeToFitWidth = true
        numberOfLines = 3
        lineBreakMode = .byTruncatingTail
        minimumScaleFactor = 0.90
        
    }
}
