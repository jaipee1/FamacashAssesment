//
//  RoundedCornerView.swift
//  FamacashAssesment
//
//  Created by jaipee on 10/07/20.
//  Copyright © 2020 JaiPrakashYadav. All rights reserved.
//

import UIKit

class RoundedCornerView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        getRoundCorners()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        getRoundCorners()
        //fatalError("init(coder:) has not been implemented")
    }
    
    private func getRoundCorners() {
        self.layer.cornerRadius = 8
        self.layer.masksToBounds = true
    }

}
