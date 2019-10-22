//
//  TipLabel.swift
//  TipCalculator
//
//  Created by Bethany Wride on 10/21/19.
//  Copyright © 2019 Bethany Bellio. All rights reserved.
//

import UIKit

class TipLabel: UILabel {
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpViews()
        updateFontTo(font: FontNames.neonFont)
    }
    
    func setUpViews() {
        self.textColor = .white
        self.tintColor = .white
    }
    
    func updateFontTo(font: String) {
        let size = self.font.pointSize
        self.font = UIFont(name: font, size: size)
    }
}
