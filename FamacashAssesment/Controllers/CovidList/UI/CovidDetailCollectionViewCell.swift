//
//  CovidDetailCollectionViewCell.swift
//  FamacashAssesment
//
//  Created by jaipee on 10/07/20.
//  Copyright © 2020 JaiPrakashYadav. All rights reserved.
//

import UIKit

class CovidDetailCollectionViewCell: UICollectionViewCell {

    @IBOutlet private weak var totalAffectedLabel: UILabel!
    @IBOutlet private weak var totalDeathLabel: UILabel!
    @IBOutlet private weak var totalRecoverdLabel: UILabel!
    @IBOutlet private weak var newRecoveredLabel: UILabel!
    @IBOutlet private weak var newDeathLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCellWith(_ model: GlobalType) {
        guard let global = model as? Global else { return }
        
        self.totalAffectedLabel.text = String(global.totalConfirmed ?? 0)
        self.totalDeathLabel.text = String(global.totalDeaths ?? 0)
        self.totalRecoverdLabel.text = String(global.totalRecovered ?? 0)
        self.newRecoveredLabel.text = String(global.newRecovered ?? 0)
        self.newDeathLabel.text = String(global.newDeaths ?? 0)
    }

}
