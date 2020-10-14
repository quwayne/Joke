//
//  CImageView.swift
//  QdaJokester
//
//  Created by Q B on 9/29/20.
//  Copyright © 2020 Quwayne. All rights reserved.
//

import UIKit


class CImageView: UIImageView {
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false 
        configure()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configure() {
        layer.cornerRadius = 12
        clipsToBounds = true
    }
}
