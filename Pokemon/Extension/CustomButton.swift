//
//  CustomButton.swift
//  Pokemon
//
//  Created by BusranurOK on 24.03.2023.
//

import Foundation
import UIKit

class CustomButton: UIButton {
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        setRadiusAndShadow()
        
    }
    
    override var isHighlighted: Bool {
        
        set { }
        get { return super.isHighlighted }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        setRadiusAndShadow()
        
    }
    
    func setRadiusAndShadow() {
        
        layer.cornerRadius = frame.height / 2
        clipsToBounds = true
        layer.masksToBounds = false
        layer.shadowRadius = 5
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: 3, height: 3)
        layer.shadowColor = UIColor.darkGray.cgColor
        
    }
    
}
