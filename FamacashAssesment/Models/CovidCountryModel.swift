//
//  CovidCountryModel.swift
//  FamacashAssesment
//
//  Created by jaipee on 10/07/20.
//  Copyright © 2020 JaiPrakashYadav. All rights reserved.
//

import Foundation

// MARK: - Country
struct Country: Codable, GlobalType {
    
    var newConfirmed: Int?
    var totalConfirmed: Int?
    var newDeaths: Int?
    var totalDeaths: Int?
    var newRecovered: Int?
    var totalRecovered: Int?
    
    var country: String?
    var countryCode: String?
    var slug: String?
    var date: String?
    var premium: Premium?

    enum CodingKeys: String, CodingKey {
        case country = "Country"
        case countryCode = "CountryCode"
        case slug = "Slug"
        case newConfirmed = "NewConfirmed"
        case totalConfirmed = "TotalConfirmed"
        case newDeaths = "NewDeaths"
        case totalDeaths = "TotalDeaths"
        case newRecovered = "NewRecovered"
        case totalRecovered = "TotalRecovered"
        case date = "Date"
        case premium = "Premium"
    }
}

// MARK: - Premium
struct Premium: Codable {
}
