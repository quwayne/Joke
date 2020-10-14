//
//  CButton.swift
//  QdaJokester
//
//  Created by Q B on 9/29/20.
//  Copyright © 2020 Quwayne. All rights reserved.
//

import UIKit


class CButton: UIButton {
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        self.translatesAutoresizingMaskIntoConstraints = false 
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    convenience init(backgroundColor: UIColor, title: String, color: UIColor) {
        self.init(frame: .zero)
        self.backgroundColor = backgroundColor
        self.setTitle(title, for: .normal)
        self.titleColor(for: .normal)
    }
    
    
    private func configure() {
        layer.cornerRadius = 10
        setTitleColor(.white, for: .normal)
        titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
    }
    
    
    func set(backgroundColor: UIColor, title: String) {
        self.backgroundColor = backgroundColor
        setTitle(title, for: .normal)
    }
}
