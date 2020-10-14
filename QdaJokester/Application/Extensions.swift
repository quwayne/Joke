//
//  Extensions.swift
//  QdaJokester
//
//  Created by Q B on 10/6/20.
//  Copyright © 2020 Quwayne. All rights reserved.
//

import UIKit

extension UIView {
    
    func addSubviews(_ views: UIView...) {
        for view in views { addSubview(view) }
    }
    
    
    func autoLayout(_ views: UIView...) {
        for view in views { view.translatesAutoresizingMaskIntoConstraints = false }
    }
}
