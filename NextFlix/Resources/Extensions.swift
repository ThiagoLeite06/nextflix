//
//  Extensions.swift
//  NextFlix
//
//  Created by Thiago Leite on 11/03/23.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach({
            addSubview($0)
        })
    }
}
