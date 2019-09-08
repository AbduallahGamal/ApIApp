//
//  customView.swift
//  ApIApp
//
//  Created by Abdalla on 9/8/19.
//  Copyright © 2019 edu.data. All rights reserved.
//

import UIKit

class customView: UIView{
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setRaduisAndShadow()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setRaduisAndShadow()
    }
    
    func setRaduisAndShadow(){
        layer.cornerRadius = 25
        clipsToBounds = true
        layer.masksToBounds = false
        layer.shadowRadius = 5
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: 3, height: 0)
    }
}
