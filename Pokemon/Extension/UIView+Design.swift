//
//  UIView+Design.swift
//  Pokemon
//
//  Created by BusranurOK on 24.03.2023.
//

import Foundation
import UIKit

class CustomView: UIView {
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        setRadiusAndShadow()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        setRadiusAndShadow()
        
    }
    
    func setRadiusAndShadow() {
        
        layer.cornerRadius = 10
        clipsToBounds = true
        layer.masksToBounds = false
        layer.shadowRadius = 10
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: 3, height: 3)
        layer.shadowColor = UIColor.darkGray.cgColor
        
    }
    
}
