//
//  CovidCountryDetailCollectionViewCell.swift
//  FamacashAssesment
//
//  Created by jaipee on 10/07/20.
//  Copyright © 2020 JaiPrakashYadav. All rights reserved.
//

import UIKit
import FlagKit

class CovidCountryDetailCollectionViewCell: UICollectionViewCell {

    @IBOutlet private weak var countryImageView: UIImageView!
    @IBOutlet private weak var countryNameLabel: UILabel!
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
        guard let country = model as? Country else { return }
        let flag = Flag(countryCode: country.countryCode ?? "")
        countryImageView.image = flag?.image(style: .roundedRect)
        self.countryNameLabel.text = country.country?.uppercased() ?? ""
        
        self.totalAffectedLabel.text = String(country.totalConfirmed ?? 0)
        self.totalDeathLabel.text = String(country.totalDeaths ?? 0)
        self.totalRecoverdLabel.text = String(country.totalRecovered ?? 0)
        self.newRecoveredLabel.text = String(country.newRecovered ?? 0)
        self.newDeathLabel.text = String(country.newDeaths ?? 0)
    }
}

/*
let countryCode = Locale.current.regionCode!
let flag = Flag(countryCode: countryCode)!

// Retrieve the unstyled image for customized use
let originalImage = flag.originalImage

// Or retrieve a styled flag
let styledImage = flag.image(style: .circle)
You can always access the underlying assets directly, through the bundled Asset Catalog:

let countryCode = Locale.current.regionCode!
let bundle = FlagKit.assetBundle
let originalImage = UIImage(named: countryCode, in: bundle, compatibleWith: nil)*/
